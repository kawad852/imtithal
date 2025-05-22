import 'package:app/screens/task/widgets/assigned_list.dart';
import 'package:shared/shared.dart';

class AssignedListBuilder extends StatefulWidget {
  final String taskId;

  const AssignedListBuilder({super.key, required this.taskId});

  @override
  State<AssignedListBuilder> createState() => _AssignedListBuilderState();
}

class _AssignedListBuilderState extends State<AssignedListBuilder> {
  late Stream<QuerySnapshot<TaskModel>> _query;

  void _initialize() {
    _query = context.taskProvider.getAssignedTasksQuery(widget.taskId).limit(5).snapshots();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ImpededStreamBuilder(
      stream: _query,
      onError: (error) => const SizedBox.shrink(),
      onLoading: () => const SizedBox.shrink(),
      onComplete: (context, snapshot) {
        final assignedTasks = snapshot.data!;
        return Offstage(
          offstage: assignedTasks.docs.isEmpty,
          child: AssignedList(assignedTasks: assignedTasks),
        );
      },
    );
  }
}
