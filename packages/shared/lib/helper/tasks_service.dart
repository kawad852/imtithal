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
    bool mainTasks = false,
  }) {
    late Query<TaskModel> tasksDocRef;
    late Query<ViolationModel> violationsDocRef;
    if (userId != null) {
      tasksDocRef = kFirebaseInstant.userAssignedTasks(userId);
      violationsDocRef = kFirebaseInstant.userViolations(userId);
    } else {
      tasksDocRef = mainTasks ? kFirebaseInstant.tasks : kFirebaseInstant.assignedTasksQuery;
      violationsDocRef = kFirebaseInstant.violations;
    }

    Filter? queryFilter;

    if (late) {
      final filter = Filter(MyFields.markedAsLate, isEqualTo: true);
      queryFilter = _getFilter(
        context,
        filter,
        userId: userId,
        date: date,
        rangeDates: rangeDates,
        departmentId: departmentId,
      );
    } else {
      if (status == TaskStatusEnum.violated.value) {
        queryFilter = _getFilter(
          context,
          null,
          userId: userId,
          departmentId: departmentId,
          date: date,
          rangeDates: rangeDates,
          timeField: MyFields.createdAt,
        );
      } else {
        final filter = status != null ? Filter(MyFields.status, isEqualTo: status) : null;
        final filter2 = isEvaluation ? Filter(MyFields.violation, isNull: true) : null;
        queryFilter = _getFilter(
          context,
          filter,
          filter2: filter2,
          userId: userId,
          date: date,
          rangeDates: rangeDates,
          departmentId: departmentId,
        );
      }
    }

    if (T == ViolationModel) {
      if (queryFilter != null) {
        return violationsDocRef.where(queryFilter).orderByCreatedAtDesc as Query<T>;
      } else {
        return violationsDocRef.orderByCreatedAtDesc as Query<T>;
      }
    } else {
      if (queryFilter != null) {
        return tasksDocRef.where(queryFilter).orderByDeliveryDateDesc as Query<T>;
      } else {
        return tasksDocRef.orderByDeliveryDateDesc as Query<T>;
      }
    }
  }

  static Filter? _getFilter(
    BuildContext context,
    Filter? filter, {
    Filter? filter2,
    required (DateTime, DateTime)? rangeDates,
    required DateTime? date,
    required String? userId,
    required String? departmentId,
    String timeField = MyFields.deliveryDate,
  }) {
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
    final startDateFilter =
        startDate != null
            ? Filter(timeField, isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
            : null;
    final endDateFilter =
        endDate != null ? Filter(timeField, isLessThan: Timestamp.fromDate(endDate)) : null;
    Filter? departmentIdFilter;
    Filter? companyIdFilter;
    if (userId != null) {
      // Do Nothing!
    } else if (departmentId != null) {
      final userIds =
          MySharedPreferences.users
              .where((e) => e.departmentId == departmentId)
              .map((e) => e.id!)
              .toList();
      departmentIdFilter = Filter(MyFields.userId, whereIn: userIds);
    } else {
      companyIdFilter = Filter(MyFields.companyId, isEqualTo: kCompanyId);
    }
    final allFilters = [
      startDateFilter,
      endDateFilter,
      departmentIdFilter,
      companyIdFilter,
      filter,
      filter2,
    ];
    final nonNullFilters = allFilters.whereType<Filter>().toList();
    switch (nonNullFilters.length) {
      case 0:
        return null;
      case 1:
        return nonNullFilters[0];
      case 2:
        return Filter.and(nonNullFilters[0], nonNullFilters[1]);
      case 3:
        return Filter.and(nonNullFilters[0], nonNullFilters[1], nonNullFilters[2]);
      case 4:
        return Filter.and(
          nonNullFilters[0],
          nonNullFilters[1],
          nonNullFilters[2],
          nonNullFilters[3],
        );
      case 5:
        return Filter.and(
          nonNullFilters[0],
          nonNullFilters[1],
          nonNullFilters[2],
          nonNullFilters[3],
          nonNullFilters[4],
        );
      case 6:
      default:
        return Filter.and(
          nonNullFilters[0],
          nonNullFilters[1],
          nonNullFilters[2],
          nonNullFilters[3],
          nonNullFilters[4],
          nonNullFilters[5],
        );
    }
  }

  ///Tasks
  static Query<TaskModel> fetchTasksList(
    BuildContext context, {
    DateTime? date,
    (DateTime, DateTime)? rangeDates,
    String? userId,
    bool mainTasks = false,
  }) {
    return TasksService.getQuery(
      context,
      status: null,
      rangeDates: rangeDates,
      date: date,
      mainTasks: kIsEmployee || kIsDepartmentManager ? false : mainTasks,
      userId: kIsEmployee ? kUserId : userId,
      departmentId: kIsDepartmentManager ? kUser.departmentId : null,
      late: false,
    );
  }

  ///Task
  static DocumentReference<TaskModel> getTask(String taskId, {required String? userId}) {
    if (userId != null && (kIsEmployee || kIsDepartmentManager)) {
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
