import 'package:shared/shared.dart';

class EmtithalSummeryBuilder extends StatefulWidget {
  final String? departmentId;
  final String? userId;

  const EmtithalSummeryBuilder({super.key, this.departmentId, this.userId});

  @override
  State<EmtithalSummeryBuilder> createState() => _EmtithalSummeryBuilderState();
}

class _EmtithalSummeryBuilderState extends State<EmtithalSummeryBuilder> {
  late Future<List<dynamic>> _futures;

  String? get _departmentId => widget.departmentId;

  Filter _getFilter(Filter filter) {
    final startDate = DateTime(kNowDate.year, kNowDate.month, 1);
    final endDate = startDate.add(Duration(days: kNowDate.day + 1));
    final startDateFilter = Filter(
      MyFields.deliveryDate,
      isGreaterThanOrEqualTo: Timestamp.fromDate(startDate),
    );
    final endDateFilter = Filter(MyFields.deliveryDate, isLessThan: Timestamp.fromDate(endDate));
    if (widget.userId != null) {
      return Filter.and(startDateFilter, endDateFilter, filter);
    } else if (widget.departmentId != null) {
      final departmentIdFilter = Filter(MyFields.user_departmentId, isEqualTo: _departmentId);
      return Filter.and(startDateFilter, endDateFilter, departmentIdFilter, filter);
    } else {
      final companyIdFilter = Filter(MyFields.companyId, isEqualTo: kCompanyId);
      return Filter.and(startDateFilter, endDateFilter, companyIdFilter, filter);
    }
  }

  Future<int> _fetch(String status, {bool late = false}) {
    late Query<TaskModel> docRef;
    if (widget.userId != null) {
      docRef = kFirebaseInstant.userAssignedTasks(widget.userId!);
    } else {
      docRef = kFirebaseInstant.collectionGroup(MyCollections.assignedTasks).taskConvertor;
    }
    late Query<TaskModel> query;
    if (late) {
      final filter = Filter(MyFields.markedAsLate, isEqualTo: true);
      query = docRef.where(_getFilter(filter));
    } else {
      final filter = Filter(MyFields.status, isEqualTo: status);
      query = docRef.where(_getFilter(filter));
    }
    return query.count().get().then((value) {
      return value.count!;
    });
  }

  void _initialize() {
    final inCompletedFuture = _fetch(TaskStatusEnum.pending.value);
    final completedFuture = _fetch(TaskStatusEnum.completed.value);
    final violatedFuture = _fetch(TaskStatusEnum.violated.value);
    final lateFuture = _fetch('', late: true);
    _futures = Future.wait([inCompletedFuture, completedFuture, violatedFuture, lateFuture]);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ImpededFutureBuilder(
      future: _futures,
      onLoading:
          () => const EmtithalSummery(
            inCompletedTasksCount: 0,
            completedTasksCount: 0,
            lateTasksCount: 0,
            violationTasksCount: 0,
            isLoading: true,
          ),
      onError: (error) => const SizedBox.shrink(),
      onComplete: (context, snapshot) {
        final inCompletedTasksCount = snapshot.data![0] as int;
        final completedTasksCount = snapshot.data![1] as int;
        final violationTasksCount = snapshot.data![2] as int;
        final lateTasksCount = snapshot.data![3] as int;
        return EmtithalSummery(
          inCompletedTasksCount: inCompletedTasksCount,
          completedTasksCount: completedTasksCount,
          lateTasksCount: lateTasksCount,
          violationTasksCount: violationTasksCount,
        );
      },
    );
  }
}
