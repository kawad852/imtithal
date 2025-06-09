import '../models/violation/violation_model.dart';
import '../shared.dart';

class TasksService {
  static Query<T> getQuery<T>(
    BuildContext context, {
    required String? status,
    required DateTime start,
    required DateTime end,
    required String? userId,
    required String? departmentId,
    required bool late,
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
          departmentId: departmentId,
          start: start,
          end: end,
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
            start: start,
            end: end,
            timeField: MyFields.createdAt,
          ),
        );
        return violationsQuery.orderByCreatedAtDesc as Query<T>;
      } else {
        final filter = status != null ? Filter(MyFields.status, isEqualTo: status) : null;
        final filter2 = Filter(MyFields.violation, isNull: true);
        tasksQuery = tasksDocRef.where(
          _getFilter(
            context,
            filter,
            filter2: filter2,
            userId: userId,
            departmentId: departmentId,
            start: start,
            end: end,
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
    required DateTime start,
    required DateTime end,
    required String? userId,
    required String? departmentId,
    String timeField = MyFields.deliveryDate,
  }) {
    final startDate = DateTime(start.year, start.month, 1);
    final endDate = startDate.add(Duration(days: end.day + 1));
    final startDateFilter = Filter(
      timeField,
      isGreaterThanOrEqualTo: Timestamp.fromDate(startDate),
    );
    final endDateFilter = Filter(timeField, isLessThan: Timestamp.fromDate(endDate));
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

  static fetchTasks(BuildContext context) {}
}
