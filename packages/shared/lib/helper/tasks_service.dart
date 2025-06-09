import '../models/violation/violation_model.dart';
import '../shared.dart';

class TasksService {
  static Query<T> getQuery<T>(
    BuildContext context, {
    required String? status,
    required (DateTime, DateTime)? rangeDates,
    required DateTime? date,
    required String? userId,
    required String? departmentId,
    required bool late,
    bool isEvaluation = false,
  }) {
    late Query<TaskModel> tasksDocRef;
    late Query<ViolationModel> violationsDocRef;
    if (userId != null) {
      tasksDocRef = kFirebaseInstant.userAssignedTasks(userId);
      violationsDocRef = kFirebaseInstant.userViolations(userId);
    } else {
      tasksDocRef = kFirebaseInstant.assignedTasksQuery;
      violationsDocRef = kFirebaseInstant.violations;
    }

    late Query<TaskModel> tasksQuery;
    late Query<ViolationModel> violationsQuery;
    if (late) {
      final filter = Filter(MyFields.markedAsLate, isEqualTo: true);
      tasksQuery = tasksDocRef.where(
        _getFilter(
          context,
          filter,
          userId: userId,
          date: date,
          rangeDates: rangeDates,
          departmentId: departmentId,
        ),
      );
      return tasksQuery.orderByDeliveryDateDesc as Query<T>;
    } else {
      if (status == TaskStatusEnum.violated.value) {
        violationsQuery = violationsDocRef.where(
          _getFilter(
            context,
            null,
            userId: userId,
            departmentId: departmentId,
            date: date,
            rangeDates: rangeDates,
            timeField: MyFields.createdAt,
          ),
        );
        return violationsQuery.orderByCreatedAtDesc as Query<T>;
      } else {
        final filter = status != null ? Filter(MyFields.status, isEqualTo: status) : null;
        final filter2 = isEvaluation ? Filter(MyFields.violation, isNull: true) : null;
        tasksQuery = tasksDocRef.where(
          _getFilter(
            context,
            filter,
            filter2: filter2,
            userId: userId,
            date: date,
            rangeDates: rangeDates,
            departmentId: departmentId,
          ),
        );
        return tasksQuery.orderByDeliveryDateDesc as Query<T>;
      }
    }
  }

  static Filter _getFilter(
    BuildContext context,
    Filter? filter, {
    Filter? filter2,
    required (DateTime, DateTime)? rangeDates,
    required DateTime? date,
    required String? userId,
    required String? departmentId,
    String timeField = MyFields.deliveryDate,
  }) {
    late Filter startDateFilter;
    late Filter endDateFilter;
    DateTime? startDate;
    DateTime? endDate;
    if (date != null) {
      startDate = DateTime(date.year, date.month, date.day);
      endDate = startDate.add(const Duration(days: 1));
    } else if (rangeDates != null) {
      final start = rangeDates.$1;
      final end = rangeDates.$2;
      startDate = DateTime(start.year, start.month, 1);
      endDate = startDate.add(Duration(days: end.day + 1));
    }
    startDateFilter = Filter(
      timeField,
      isGreaterThanOrEqualTo: startDate != null ? Timestamp.fromDate(startDate) : null,
    );
    endDateFilter = Filter(
      timeField,
      isLessThan: endDate != null ? Timestamp.fromDate(endDate) : null,
    );
    if (userId != null) {
      return Filter.and(startDateFilter, endDateFilter, filter, filter2);
    } else if (departmentId != null) {
      final users = context.read<List<UserModel>>();
      final userIds = users.where((e) => e.departmentId == departmentId).map((e) => e.id!).toList();
      final departmentIdFilter = Filter(MyFields.userId, whereIn: userIds);
      return Filter.and(startDateFilter, endDateFilter, departmentIdFilter, filter, filter2);
    } else {
      final companyIdFilter = Filter(MyFields.companyId, isEqualTo: kCompanyId);
      return Filter.and(startDateFilter, endDateFilter, companyIdFilter, filter, filter2);
    }
  }

  ///Tasks
  static Query<TaskModel> fetchTasksList(
    BuildContext context, {
    DateTime? date,
    (DateTime, DateTime)? rangeDates,
    String? userId,
  }) {
    return TasksService.getQuery(
      context,
      status: null,
      rangeDates: rangeDates,
      date: date,
      userId: userId ?? (kIsEmployee ? kUserId : null),
      departmentId: kIsDepartmentManager ? kUser.departmentId : null,
      late: false,
    );
  }

  ///Task
  static DocumentReference<TaskModel> getTask(String taskId, {required String userId}) {
    if (kIsEmployee || kIsDepartmentManager) {
      return kFirebaseInstant.userAssignedTasks(userId).doc(taskId);
    }
    return kFirebaseInstant.tasks.doc(taskId);
  }

  static Query<TaskModel> getAssignedTasksQuery(String parentTaskId) {
    return kFirebaseInstant.assignedTasksQuery.orderByCreatedAtDesc.where(
      MyFields.parentTaskId,
      isEqualTo: parentTaskId,
    );
  }
}
