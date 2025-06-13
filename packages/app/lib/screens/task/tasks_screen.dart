import 'package:app/screens/task/widgets/task_card.dart';
import 'package:shared/shared.dart';

class TasksScreen extends StatefulWidget {
  final TaskStatusEnum status;
  final bool late;
  final String? userId;
  final String? departmentId;
  final DateTime startDate, endDate;

  const TasksScreen({
    super.key,
    required this.status,
    this.late = false,
    this.userId,
    this.departmentId,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Query<TaskModel> _query;

  String? get _userId => widget.userId;

  void _initialize() {
    _query = TasksService.getQuery<TaskModel>(
      context,
      status: widget.status.value,
      rangeDates: null,
      date: null,
      userId: widget.userId,
      departmentId: widget.departmentId,
      late: widget.late,
    );
  }

  (String, Color) _getTaskInfo(BuildContext context) {
    if (widget.late) {
      return (context.appLocalization.lateTasks, context.colorPalette.yellowE7B);
    } else {
      switch (widget.status) {
        case TaskStatusEnum.pending:
          return (context.appLocalization.incompleteTasks, context.colorPalette.greyDAD);
        case TaskStatusEnum.completed:
          return (context.appLocalization.completedTasks, context.colorPalette.green04B);
        case TaskStatusEnum.violated:
          return (context.appLocalization.monitoredViolations, context.colorPalette.redD62);
        case TaskStatusEnum.inReview:
          throw UnimplementedError();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    final task = _getTaskInfo(context);
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "${task.$1} ${(_userId != null && !kIsEmployee) ? "-" : ""} ${(_userId != null && !kIsEmployee) ? kUser.displayName : ""}",
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: CustomFirestoreQueryBuilder(
                query: _query,
                onComplete: (context, snapshot) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: snapshot.docs.length,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      if (snapshot.isLoadingMore(index)) {
                        return const FPLoading();
                      }
                      final task = snapshot.docs[index].data();
                      return TaskCard(task: task, showUser: true);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
