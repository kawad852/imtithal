import 'package:app/screens/task/widgets/task_card.dart';
import 'package:shared/shared.dart';

class TasksScreen extends StatefulWidget {
  final TaskStatusEnum status;
  final bool late;

  const TasksScreen({super.key, required this.status, this.late = false});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Query<TaskModel> _query;

  Query<TaskModel> get _getQuery {
    late Query<TaskModel> query;
    late Filter filter;
    final companyIdFilter = Filter(MyFields.companyId, isEqualTo: kCompanyId);
    if (widget.late) {
      filter = Filter.and(Filter(MyFields.markedAsLate, isEqualTo: true), companyIdFilter);
    } else {
      filter = Filter.and(Filter(MyFields.status, isEqualTo: widget.status.value), companyIdFilter);
    }
    if (kIsEmployee) {
      return kFirebaseInstant.assignedTasks.where(filter);
    } else {
      query = kFirebaseInstant.tasks.where(filter);
    }
    return query.orderByDeliveryDateDesc;
  }

  void _initialize() {
    _query = _getQuery;
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${task.$1} ${kIsEmployee ? "" : "-"} ${kIsEmployee ? "" : kUser.displayName}",
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: CustomFirestoreQueryBuilder(
                query: _query,
                onComplete: (context, snapshot) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: snapshot.docs.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      final task = snapshot.docs[index].data();
                      return TaskCard(task: task);
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
