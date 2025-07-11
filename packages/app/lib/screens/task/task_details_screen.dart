import 'package:app/screens/task/widgets/attachment_bubble.dart';
import 'package:app/screens/task/widgets/imtithal_button.dart';
import 'package:app/screens/task/widgets/user_rail.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late Stream<DocumentSnapshot<TaskModel>> _stream;

  TaskModel get _task => widget.task;
  String get _taskId => _task.id;
  LightUserModel? get _user => _task.user;

  void _initialize() {
    _stream = TasksService.getTask(task: _task).snapshots();
  }

  @override
  void initState() {
    super.initState();
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
                      taskQuerySnapshot.reference.update({
                        MyFields.status: TaskStatusEnum.inReview.value,
                      });
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${context.appLocalization.attachedFiles} (${task.attachments!.length})",
                    style: style.copyWith(
                      color: context.colorPalette.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemCount: task.attachments!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final attachment = task.attachments![index];
                      return AttachmentBubble(file: attachment);
                    },
                  ),
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
