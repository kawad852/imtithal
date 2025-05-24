import 'package:shared/shared.dart';

class EmtithalSummeryBuilder extends StatefulWidget {
  const EmtithalSummeryBuilder({super.key});

  @override
  State<EmtithalSummeryBuilder> createState() => _EmtithalSummeryBuilderState();
}

class _EmtithalSummeryBuilderState extends State<EmtithalSummeryBuilder> {
  late Future<List<dynamic>> _futures;

  Filter _getFilter(Filter filter) {
    final startDate = DateTime(kNowDate.year, kNowDate.month, kNowDate.day);
    final endDate = startDate.add(const Duration(days: 1));
    return Filter.and(
      Filter(MyFields.deliveryDate, isGreaterThanOrEqualTo: Timestamp.fromDate(startDate)),
      Filter(MyFields.deliveryDate, isLessThan: Timestamp.fromDate(endDate)),
      Filter(MyFields.companyId, isEqualTo: kCompanyId),
      filter,
    );
  }

  Future<int> _fetch(String status, {bool late = false}) {
    Query<TaskModel> docRef =
        kFirebaseInstant.collectionGroup(MyCollections.assignedTasks).taskConvertor;
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
          ),
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
