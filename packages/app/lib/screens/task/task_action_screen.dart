import 'package:app/screens/task/employee_selection_screen.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskActionScreen extends StatefulWidget {
  final TaskModel task;

  const TaskActionScreen({super.key, required this.task});

  @override
  State<TaskActionScreen> createState() => _TaskActionScreenState();
}

class _TaskActionScreenState extends State<TaskActionScreen> {
  late Stream<List<UserModel>> _usersStream;

  TaskModel get _task => widget.task;

  void _initialize() {
    _usersStream = context.taskProvider.getTaskUsers(_task.id);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _usersStream,
      onComplete: (context, snapshot) {
        final users = snapshot.data!;
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
                        return EmployeeSelectionScreen(usersStream: _usersStream);
                      });
                    },
                    icon: MyIcons.userEdit,
                    title: context.appLocalization.addRemoveEmployee,
                  ),
                  const SizedBox(width: 10),
                  ActionButton(
                    onTap: () {},
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
              if (users.isNotEmpty) ...[
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
                  itemCount: users.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ResponsibleEmployee(user: user);
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
