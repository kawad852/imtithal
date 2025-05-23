import 'package:app/screens/task/employee_selection_screen.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskActionScreen extends StatefulWidget {
  final TaskModel task;
  final QuerySnapshot<TaskModel> assignedTasks;

  const TaskActionScreen({super.key, required this.task, required this.assignedTasks});

  @override
  State<TaskActionScreen> createState() => _TaskActionScreenState();
}

class _TaskActionScreenState extends State<TaskActionScreen> {
  late Stream<DocumentSnapshot<TaskModel>> _taskStream;
  late Query<TaskModel> _assignedTasksQuery;

  TaskModel get _task => widget.task;
  String get _taskId => _task.id;

  void _initialize() {
    _taskStream = context.taskProvider.getTaskDocRef(_taskId).snapshots();
    _assignedTasksQuery = context.taskProvider.getAssignedTasksQuery(_taskId);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _taskStream,
      onComplete: (context, snapshot) {
        final taskQuerySnapshot = snapshot.data!;
        final task = taskQuerySnapshot.data()!;
        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            children: [
              Text(
                context.appLocalization.takingActionOnTask,
                style: TextStyle(
                  color: context.colorPalette.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "تقارير المحاميين للعمل الميداني",
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  ActionButton(
                    onTap: () {
                      context.push((context) {
                        return EmployeeSelectionScreen(task: task);
                      });
                    },
                    icon: MyIcons.userEdit,
                    title: context.appLocalization.addRemoveEmployee,
                  ),
                  const SizedBox(width: 10),
                  ActionButton(
                    onTap: () {
                      context.push((context) {
                        return TaskInputScreen(task: task);
                      });
                    },
                    icon: MyIcons.messageEdit,
                    title: context.appLocalization.modifyTask,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: Text(
              //     context.appLocalization.responsibleDepartment,
              //     style: TextStyle(
              //       color: context.colorPalette.primary,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              // ResponsibleDepartment(task: _task, users: users),
              CustomFirestoreQueryBuilder(
                query: _assignedTasksQuery,
                onComplete: (context, snapshot) {
                  final assignedTasks = snapshot.docs;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          context.appLocalization.responsibleEmployees,
                          style: TextStyle(
                            color: context.colorPalette.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: assignedTasks.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final assignedTask = assignedTasks[index];
                          return ResponsibleEmployee(assignedTaskQuerySnapshot: assignedTask);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
