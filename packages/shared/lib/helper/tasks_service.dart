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
    bool generalViolationOnly = false,
    String? parentTaskId,
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
          isEvaluation
              ? Filter(MyFields.status, isNotEqualTo: ViolationStatus.canceled.value)
              : null,
          userId: userId,
          departmentId: departmentId,
          date: date,
          rangeDates: rangeDates,
          timeField: MyFields.createdAt,
          generalViolationOnly: generalViolationOnly,
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
        late Filter filter;
        if (parentTaskId != null) {
          filter = Filter.and(queryFilter, Filter(MyFields.parentTaskId, isEqualTo: parentTaskId));
        } else {
          filter = queryFilter;
        }
        return tasksDocRef.where(filter).orderByDeliveryDateDesc as Query<T>;
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
    bool generalViolationOnly = false,
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
    Filter? generalViolationFilter;
    if (userId != null) {
      if (generalViolationOnly) {
        generalViolationFilter = Filter(MyFields.taskId, isNull: true);
      }
    } else if (departmentId != null) {
      departmentIdFilter = Filter(MyFields.user_departmentId, isEqualTo: departmentId);
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
      generalViolationFilter,
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
        return Filter.and(
          nonNullFilters[0],
          nonNullFilters[1],
          nonNullFilters[2],
          nonNullFilters[3],
          nonNullFilters[4],
          nonNullFilters[5],
        );
      default:
        return Filter.and(
          nonNullFilters[0],
          nonNullFilters[1],
          nonNullFilters[2],
          nonNullFilters[3],
          nonNullFilters[4],
          nonNullFilters[5],
          nonNullFilters[6],
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
    String? parentTaskId,
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
      parentTaskId: parentTaskId,
    );
  }

  ///Task
  static DocumentReference<TaskModel> getTask({required TaskModel task}) {
    final userId = task.user?.id;
    if (userId != null) {
      return kFirebaseInstant.userAssignedTasks(userId).doc(task.id);
    } else {
      return kFirebaseInstant.tasks.doc(task.id);
    }
  }

  static Query<TaskModel> getAssignedTasksQuery(String parentTaskId) {
    final query = kFirebaseInstant.assignedTasksQuery.orderByCreatedAtDesc.where(
      MyFields.parentTaskId,
      isEqualTo: parentTaskId,
    );
    return query;
  }
}
