import 'package:app/screens/user/users_selection_screen.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

import '../calender/widgets/calendar_date_text.dart';
import '../calender/widgets/calendar_icon_button.dart';

class TaskActionScreen extends StatefulWidget {
  final TaskModel task;

  const TaskActionScreen({super.key, required this.task});

  @override
  State<TaskActionScreen> createState() => _TaskActionScreenState();
}

class _TaskActionScreenState extends State<TaskActionScreen> {
  late Stream<DocumentSnapshot<TaskModel>> _taskStream;
  late DateTime _selectedDate;

  TaskModel get _task => widget.task;

  void _initialize() {
    _taskStream = TasksService.getTask(task: _task).snapshots();
  }

  void _onAddUsers(BuildContext context, {required List<UserModel> selectedUsers}) async {
    List<LightUserModel> assignedUsers =
        selectedUsers
            .map(
              (e) => LightUserModel(
                id: e.id!,
                departmentId: e.departmentId!,
                displayName: e.displayName,
              ),
            )
            .toList();
    final assignedUserIds = assignedUsers.map((e) => e.id).toList();
    final assignedDepartmentIds = assignedUsers.map((e) => e.departmentId).toList();
    final taskDocRef = kFirebaseInstant.tasks.doc(_task.id);
    taskDocRef.update({
      MyFields.assignedUsers: assignedUsers.map((e) => e.toJson()).toList(),
      MyFields.assignedUserIds: assignedUserIds,
      MyFields.assignedDepartmentIds: assignedDepartmentIds,
    });
    context.showSnackBar(context.appLocalization.progressingUserMsg);
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = kNowDate;
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
                  task.title,
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
                      context
                          .navigate((context) {
                            return UsersSelectionScreen(userIds: task.assignedUserIds);
                          })
                          .then((value) {
                            if (value != null && context.mounted) {
                              _onAddUsers(context, selectedUsers: value);
                            }
                          });
                    },
                    icon: MyIcons.userEdit,
                    title: context.appLocalization.addRemoveEmployee,
                  ),
                  const SizedBox(width: 10),
                  ActionButton(
                    onTap: () {
                      context.navigate((context) {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.appLocalization.responsibleEmployees,
                        style: TextStyle(
                          color: context.colorPalette.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CalendarDateText(date: _selectedDate, fullDate: true),
                        CalendarIconButton(
                          value: _selectedDate,
                          minDateTime: kNowDate,
                          onChanged: (value) {
                            setState(() {
                              _selectedDate = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              UsersSelector(
                builder: (context, users) {
                  return CustomFirestoreQueryBuilder(
                    query: TasksService.fetchTasksList(context, date: _selectedDate),
                    onComplete: (context, snapshot) {
                      final assignedTasks = snapshot.docs;
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: assignedTasks.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (snapshot.isLoadingMore(index)) {
                            return const FPLoading();
                          }
                          final assignedTask = assignedTasks[index].data();
                          assignedTask.userModel ??= users.firstWhere(
                            (e) => e.id == assignedTask.user!.id,
                            orElse: () => UserModel(),
                          );
                          return ResponsibleEmployee(assignedTask: assignedTask);
                        },
                      );
                    },
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
