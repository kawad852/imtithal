import 'package:app/screens/user/users_selection_screen.dart';
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

  void _onAddUsers(BuildContext context, {required List<UserModel> selectedUsers}) {
    ApiService.fetch(
      context,
      callBack: () async {
        final batch = kFirebaseInstant.batch();
        List<String> userIds = selectedUsers.map((e) => e.id!).toList();
        for (var e in selectedUsers) {
          _task.user = LightUserModel(id: e.id!, departmentId: e.departmentId);
          final taskDocRef = kFirebaseInstant.tasks.doc(_task.id);
          final assignedTaskId = await RowIdHelper().getAssignedTaskId();
          final assignedTaskDocRef = kFirebaseInstant.users
              .doc(e.id)
              .collection(MyCollections.assignedTasks)
              .taskConvertor
              .doc(assignedTaskId);
          batch.set(assignedTaskDocRef, _task.copyWith(id: assignedTaskId, parentTaskId: _task.id));
          batch.update(taskDocRef, {
            MyFields.assignedUserIds: FieldValue.arrayUnion(userIds),
            MyFields.inCompletedTasksCount: FieldValue.increment(1),
          });
        }
        await batch.commit();
        if (context.mounted) {
          context.showSnackBar(context.appLocalization.savedSuccessfully);
        }
      },
    );
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
              UsersSelector(
                builder: (context, users) {
                  return CustomFirestoreQueryBuilder(
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
                              if (snapshot.isLoadingMore(index)) {
                                return const FPLoading();
                              }
                              final assignedTask = assignedTasks[index].data();
                              assignedTask.userModel ??= users.firstWhere(
                                (e) => e.id == assignedTask.user?.id,
                                orElse: () => UserModel(),
                              );
                              return ResponsibleEmployee(assignedTask: assignedTask);
                            },
                          ),
                        ],
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
