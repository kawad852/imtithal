import 'package:shared/shared.dart';

import 'status_summery_bubbles.dart';

class SummeryBuilder extends StatefulWidget {
  final String? departmentId;
  final String? userId;
  final Widget Function(
    (int, double) inCompletedTasks,
    (int, double) completedTasks,
    (int, double) violationTasks,
    (int, double) lateTasks,
  )
  builder;

  const SummeryBuilder({super.key, this.departmentId, this.userId, required this.builder});

  @override
  State<SummeryBuilder> createState() => _SummeryBuilderState();
}

class _SummeryBuilderState extends State<SummeryBuilder> {
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

  Future<(int, double)> _fetch(String status, {bool late = false}) async {
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

    final c = await query.count().get().then((value) {
      final v = value.count!;
      return v;
    });
    final s = await query.aggregate(sum(MyFields.points)).get().then((value) {
      final v = value.getSum(MyFields.points)!;
      return v;
    });

    return (c, s);
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
          () => const StatusSummeryBubbles(
            inCompletedTasksCount: 0,
            completedTasksCount: 0,
            lateTasksCount: 0,
            violationTasksCount: 0,
            isLoading: true,
          ),
      onError: (error) => const SizedBox.shrink(),
      onComplete: (context, snapshot) {
        final inCompletedTasks = snapshot.data![0] as (int, double);
        final completedTasks = snapshot.data![1] as (int, double);
        final violationTasks = snapshot.data![2] as (int, double);
        final lateTasks = snapshot.data![3] as (int, double);
        return widget.builder(inCompletedTasks, completedTasks, violationTasks, lateTasks);
      },
    );
  }
}

class SummeryModel {
  int count;
  double sum;

  SummeryModel({required this.count, required this.sum});
}
