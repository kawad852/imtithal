import 'package:shared/shared.dart';

import 'status_summery_bubbles.dart';

class SummeryBuilder extends StatefulWidget {
  final String? departmentId;
  final String? userId;
  final DateTime startDate;
  final DateTime endDate;

  final Widget Function(
    (int, double) inCompletedTasks,
    (int, double) completedTasks,
    (int, double) violationTasks,
    (int, double) lateTasks,
  )
  builder;

  const SummeryBuilder({
    super.key,
    this.departmentId,
    this.userId,
    required this.builder,
    required this.startDate,
    required this.endDate,
  });

  static Query<TaskModel> getQuery({
    required DateTime start,
    required DateTime end,
    required String status,
    required String? userId,
    required String? departmentId,
    required bool late,
  }) {
    late Query<TaskModel> docRef;
    if (userId != null) {
      docRef = kFirebaseInstant.userAssignedTasks(userId);
    } else {
      docRef = kFirebaseInstant.assignedTasksQuery;
    }

    late Query<TaskModel> query;
    if (late) {
      final filter = Filter(MyFields.markedAsLate, isEqualTo: true);
      query = docRef.where(
        _getFilter(filter, userId: userId, departmentId: departmentId, start: start, end: end),
      );
    } else {
      final filter = Filter(MyFields.status, isEqualTo: status);
      query = docRef.where(
        _getFilter(filter, userId: userId, departmentId: departmentId, start: start, end: end),
      );
    }
    return query;
  }

  static Filter _getFilter(
    Filter filter, {
    required DateTime start,
    required DateTime end,
    required String? userId,
    required String? departmentId,
  }) {
    final startDate = DateTime(start.year, start.month, 1);
    final endDate = startDate.add(Duration(days: end.day + 1));
    final startDateFilter = Filter(
      MyFields.deliveryDate,
      isGreaterThanOrEqualTo: Timestamp.fromDate(startDate),
    );
    final endDateFilter = Filter(MyFields.deliveryDate, isLessThan: Timestamp.fromDate(endDate));
    if (userId != null) {
      return Filter.and(startDateFilter, endDateFilter, filter);
    } else if (departmentId != null) {
      final departmentIdFilter = Filter(MyFields.user_departmentId, isEqualTo: departmentId);
      return Filter.and(startDateFilter, endDateFilter, departmentIdFilter, filter);
    } else {
      final companyIdFilter = Filter(MyFields.companyId, isEqualTo: kCompanyId);
      return Filter.and(startDateFilter, endDateFilter, companyIdFilter, filter);
    }
  }

  @override
  State<SummeryBuilder> createState() => _SummeryBuilderState();
}

class _SummeryBuilderState extends State<SummeryBuilder> {
  late Future<List<dynamic>> _futures;

  String? get _departmentId => widget.departmentId;
  DateTime get _startDate => widget.startDate;
  DateTime get _endDate => widget.endDate;

  Future<(int, double)> _fetch(String status, {bool late = false}) async {
    final query = SummeryBuilder.getQuery(
      start: _startDate,
      end: _endDate,
      status: status,
      userId: widget.userId,
      departmentId: _departmentId,
      late: late,
    );

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
  void didUpdateWidget(covariant SummeryBuilder oldWidget) {
    if (oldWidget.startDate != widget.startDate || oldWidget.endDate != widget.endDate) {
      setState(() {
        _initialize();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ImpededFutureBuilder(
      future: _futures,
      onLoading:
          () => StatusSummeryBubbles(
            inCompletedTasksCount: 0,
            completedTasksCount: 0,
            lateTasksCount: 0,
            violationTasksCount: 0,
            isLoading: true,
            startDate: kNowDate,
            endDate: kNowDate,
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
