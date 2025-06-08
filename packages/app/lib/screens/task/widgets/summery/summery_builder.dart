import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class SummeryBuilder extends StatefulWidget {
  final String? departmentId;
  final String? userId;
  final DateTime startDate;
  final DateTime endDate;
  final double height;

  final Widget Function(
    (int, double) inCompletedTasks,
    (int, double) completedTasks,
    (int, double) violationTasks,
    (int, double) lateTasks,
    (UserModel?, UserModel?) users,
    (int, String, Color) percentageValues,
  )
  builder;

  const SummeryBuilder({
    super.key,
    this.departmentId,
    this.userId,
    required this.builder,
    required this.startDate,
    required this.endDate,
    required this.height,
  });

  static Query<T> getQuery<T>(
    BuildContext context, {
    required String? status,
    required DateTime start,
    required DateTime end,
    required String? userId,
    required String? departmentId,
    required bool late,
  }) {
    late Query<TaskModel> docRef;
    late Query<ViolationModel> violationsDocRef;
    if (userId != null) {
      docRef = kFirebaseInstant.userAssignedTasks(userId);
      violationsDocRef = kFirebaseInstant.userViolations(userId);
    } else {
      docRef = kFirebaseInstant.assignedTasksQuery;
      violationsDocRef = kFirebaseInstant.violations;
    }

    late Query<TaskModel> query;
    late Query<ViolationModel> violationsQuery;
    if (late) {
      final filter = Filter(MyFields.markedAsLate, isEqualTo: true);
      query = docRef.where(
        _getFilter(
          context,
          filter,
          userId: userId,
          departmentId: departmentId,
          start: start,
          end: end,
        ),
      );
      return query as Query<T>;
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
        return violationsQuery as Query<T>;
      } else {
        final filter = status != null ? Filter(MyFields.status, isEqualTo: status) : null;
        final filter2 = Filter(MyFields.violation, isNull: true);
        query = docRef.where(
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
        return query as Query<T>;
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
      final userIds = users.map((e) => e.id!).toList();
      final departmentIdFilter = Filter(MyFields.userId, whereIn: userIds);
      return Filter.and(startDateFilter, endDateFilter, departmentIdFilter, filter, filter2);
    } else {
      final companyIdFilter = Filter(MyFields.companyId, isEqualTo: kCompanyId);
      return Filter.and(startDateFilter, endDateFilter, companyIdFilter, filter, filter2);
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

  Future<(int, double)> _fetchQuery<T>(
    BuildContext context,
    String? status, {
    bool late = false,
    required String? userId,
    required String? departmentId,
  }) async {
    final query = SummeryBuilder.getQuery<T>(
      context,
      status: status,
      start: _startDate,
      end: _endDate,
      userId: userId,
      departmentId: departmentId,
      late: late,
    );

    final c = await query.count().get().then((value) {
      final v = value.count!;
      return v;
    });

    double s = 0.0;

    if (status == TaskStatusEnum.completed.value) {
      s = (c * TaskPoints.imtithal.value).toDouble();
    } else if (late) {
      s = (c * TaskPoints.late.value).toDouble();
    }

    return (c, s);
  }

  Future<(UserModel?, UserModel?)> _fetchHighestUser(
    BuildContext context,
    String status, {
    required bool descending,
  }) async {
    final departmentUsers = Provider.of<List<UserModel>>(
      context,
      listen: false,
    ).where((e) => e.departmentId == _departmentId);

    if (departmentUsers.isNotEmpty) {
      for (var e in departmentUsers) {
        final userId = e.id;
        (int, double) values = await _fetchQuery(context, null, userId: userId, departmentId: null);
        if (context.mounted) {
          final imtithalPercentage =
              TaskPoints.getPercentage(context, count: values.$1, sum: values.$2).$1;
          e.imtithalPercentage = imtithalPercentage;
        }
      }

      final highestUser = departmentUsers.reduce(
        (a, b) => a.imtithalPercentage > b.imtithalPercentage ? a : b,
      );

      final lowestUser = departmentUsers.reduce(
        (a, b) => a.imtithalPercentage < b.imtithalPercentage ? a : b,
      );

      final violationValues = await _fetchQuery(
        context,
        TaskStatusEnum.violated.value,
        userId: lowestUser.id,
        departmentId: null,
      );
      lowestUser.violatedCount = violationValues.$1;

      return (highestUser, lowestUser);
    }
    return (null, null);
  }

  void _initialize(BuildContext context) {
    Future<(int, double)> query<T>(String? status, {bool late = false}) => _fetchQuery(
      context,
      status,
      userId: widget.userId,
      departmentId: _departmentId,
      late: late,
    );
    final inCompletedFuture = query<TaskModel>(TaskStatusEnum.pending.value);
    final completedFuture = query<TaskModel>(TaskStatusEnum.completed.value);
    final violatedFuture = query<ViolationModel>(TaskStatusEnum.violated.value);
    final lateFuture = query<TaskModel>(null, late: true);
    late Future<(UserModel?, UserModel?)> usersFuture;
    if (_departmentId != null) {
      usersFuture = _fetchHighestUser(context, TaskStatusEnum.completed.value, descending: true);
    } else {
      usersFuture = Future.value((null, null));
    }
    _futures = Future.wait([
      inCompletedFuture,
      completedFuture,
      violatedFuture,
      lateFuture,
      usersFuture,
    ]);
  }

  @override
  void initState() {
    super.initState();
    _initialize(context);
  }

  @override
  void didUpdateWidget(covariant SummeryBuilder oldWidget) {
    if (oldWidget.startDate != widget.startDate || oldWidget.endDate != widget.endDate) {
      setState(() {
        _initialize(context);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ImpededFutureBuilder(
      future: _futures,
      onLoading:
          () => SizedBox(
            height: widget.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: const Alignment(0, -1),
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: context.colorPalette.primary,
                  rightDotColor: context.colorPalette.redD62,
                  size: 30,
                ),
              ),
            ),
          ),
      // () => StatusSummeryBubbles(
      //   inCompletedTasksCount: 0,
      //   completedTasksCount: 0,
      //   lateTasksCount: 0,
      //   violationTasksCount: 0,
      //   isLoading: true,
      //   startDate: kNowDate,
      //   endDate: kNowDate,
      // ),
      onError: (error) => const SizedBox.shrink(),
      onComplete: (context, snapshot) {
        final inCompletedTasks = snapshot.data![0] as (int, double);
        final completedTasks = snapshot.data![1] as (int, double);
        final violationTasks = snapshot.data![2] as (int, double);
        final lateTasks = snapshot.data![3] as (int, double);
        final users = snapshot.data![4] as (UserModel?, UserModel?);

        final totalCount =
            inCompletedTasks.$1 + completedTasks.$1 + violationTasks.$1 + lateTasks.$1;
        final totalSum = inCompletedTasks.$2 + completedTasks.$2 + violationTasks.$2 + lateTasks.$2;
        final percentageValues = TaskPoints.getPercentage(
          context,
          count: totalCount,
          sum: totalSum,
        );

        return widget.builder(
          inCompletedTasks,
          completedTasks,
          violationTasks,
          lateTasks,
          users,
          percentageValues,
        );
      },
    );
  }
}

class SummeryModel {
  int count;
  double sum;

  SummeryModel({required this.count, required this.sum});
}
