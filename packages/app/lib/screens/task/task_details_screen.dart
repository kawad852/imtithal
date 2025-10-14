import 'package:app/screens/task/widgets/attachment_bubble.dart';
import 'package:app/screens/task/widgets/imtithal_button.dart';
import 'package:app/screens/task/widgets/user_rail.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/models/attachment/attachment_model.dart';
import 'package:shared/shared.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late FilePickerHelper _filePickerHelper;
  late Stream<DocumentSnapshot<TaskModel>> _stream;
  final List<XFile> _files = [];

  TaskModel get _task => widget.task;
  String get _taskId => _task.id;
  LightUserModel? get _user => _task.user;

  void _initialize() {
    _stream = TasksService.getTask(task: _task).snapshots();
  }

  @override
  void initState() {
    super.initState();
    _filePickerHelper = FilePickerHelper(
      onChanged: (files) {
        setState(() {
          _files.addAll(files);
        });
      },
    );
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.colorPalette.grey8B8,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    return BigStreamBuilder(
      stream: _stream,
      onComplete: (context, snapshot) {
        final taskQuerySnapshot = snapshot.data!;
        final task = taskQuerySnapshot.data()!;
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (task.user != null && (kIsAdmin || kIsEmtithalManager))
                ImtithalButton(assignedTask: task, user: UiHelper.getUser(task.user!.id)),
            ],
          ),
          bottomNavigationBar:
              kIsEmployee && task.status == TaskStatusEnum.pending.value
                  ? BottomButton(
                    text: context.appLocalization.completeTask,
                    onPressed: () {
                      _filePickerHelper.pickSomething(
                        context,
                        onSuccess: () {
                          ApiService.fetch(
                            context,
                            callBack: () async {
                              final files = await StorageService().uploadFiles("tasks", _files);
                              final filesAsJson = files.map((e) => e.toJson()).toList();
                              final array = FieldValue.arrayUnion(filesAsJson);
                              final status = TaskStatusEnum.inReview.value;
                              await taskQuerySnapshot.reference.update({
                                MyFields.status: status,
                                MyFields.order: TaskStatusEnum.getOrder(status),
                                MyFields.userAttachments: array,
                              });
                              await kFirebaseInstant.tasks.doc(task.parentTaskId).update({
                                MyFields.userAttachments: array,
                              });
                              final users =
                                  MySharedPreferences.users
                                      .where(
                                        (e) =>
                                            e.role == RoleEnum.admin.value ||
                                            e.role == RoleEnum.emtithalManager.value,
                                      )
                                      .toList();
                              for (var user in users) {
                                SendNotificationService.sendToUser(
                                  context,
                                  userId: user.id!,
                                  deviceToken: user.deviceToken,
                                  languageCode: user.languageCode,
                                  id: task.id,
                                  type: NotificationType.completedTask.value,
                                  titleEn: "Task Completed",
                                  titleAr: "مهمة مكتملة",
                                  bodyEn: "${kUser.displayName} completed the task #${task.id}",
                                  bodyAr: "${kUser.displayName} إكمل المهمة #${task.id}",
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  )
                  : null,
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            children: [
              if (_user != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      UserRail(lightUser: _user!, color: task.indicatorColor(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _user!.displayName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                // color: context.colorPalette.grey8B8,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Text(
                task.title,
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (kIsEmployee)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: task.indicatorColor(context),
                      borderRadius: BorderRadius.circular(kRadiusSecondary),
                    ),
                    child: Text(
                      TaskStatusEnum.getLabel(task.status, context),
                      style: TextStyle(
                        color: context.colorPalette.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  context.appLocalization.notesAboutTheTask,
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(task.notes, style: style),
              if (task.attachments != null) ...[
                Builder(
                  builder: (context) {
                    List<AttachmentModel> attachments = [];
                    attachments.addAll(task.attachments!);
                    if (task.userAttachments != null) {
                      attachments.addAll(task.userAttachments!);
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${context.appLocalization.attachedFiles} (${attachments.length})",
                            style: style.copyWith(
                              color: context.colorPalette.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              itemCount: attachments.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final attachment = attachments[index];
                                return AttachmentBubble(file: attachment);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  context.appLocalization.penaltyForNonCompliance,
                  style: style.copyWith(
                    color: context.colorPalette.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(task.violationDescription, style: style),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  context.appLocalization.timeRemainingUntilDeadline,
                  style: style.copyWith(
                    color: context.colorPalette.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TimerBuilder(
                endDateTime: task.deliveryDate,
                child: (context, duration) {
                  return Row(
                    children: [
                      TimeCard(title: context.appLocalization.second, value: duration.$4),
                      const SizedBox(width: 10),
                      TimeCard(title: context.appLocalization.minute, value: duration.$3),
                      const SizedBox(width: 10),
                      TimeCard(title: context.appLocalization.hour, value: duration.$2),
                      const SizedBox(width: 10),
                      TimeCard(title: context.appLocalization.day, value: duration.$1),
                    ],
                  );
                },
              ),
              // if (!kIsEmployee) ...[
              ResponsibleCard(task: task),
              // StatusSummeryBubbles(
              //   inCompletedTasksCount: task.inCompletedTasksCount,
              //   completedTasksCount: task.completedTasksCount,
              //   lateTasksCount: task.lateTasksCount,
              //   violationTasksCount: task.violationTasksCount,
              //   startDate: kNowDate,
              //   endDate: kNowDate,
              // ),
              // ],
            ],
          ),
        );
      },
    );
  }
}
