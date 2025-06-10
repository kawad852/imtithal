import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late Stream<List<dynamic>> _streams;

  TaskModel get _task => widget.task;
  String get _taskId => _task.id;

  void _initialize() {
    final taskQuery = TasksService.getTask(_taskId, userId: _task.userId!);
    var assignedTasksQuery = TasksService.getAssignedTasksQuery(
      kIsEmployee ? _task.parentTaskId! : _taskId,
    ).limit(10);
    _streams =
        Rx.combineLatest2<DocumentSnapshot<TaskModel>, QuerySnapshot<TaskModel>, List<dynamic>>(
          taskQuery.snapshots(),
          assignedTasksQuery.snapshots(),
          (s1, s2) {
            return [s1, s2];
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
    final style = TextStyle(
      color: context.colorPalette.grey8B8,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    return BigStreamBuilder(
      stream: _streams,
      onComplete: (context, snapshot) {
        final taskQuerySnapshot = snapshot.data![0] as DocumentSnapshot<TaskModel>;
        final assignedTasksQuerySnapshot = snapshot.data![1] as QuerySnapshot<TaskModel>;
        final task = taskQuerySnapshot.data()!;
        return Scaffold(
          appBar: AppBar(),
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
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        height: 40,
                        constraints: const BoxConstraints(maxWidth: 150),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.colorPalette.greyF5F,
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                        ),
                        child: Text(
                          attachment.name,
                          style: TextStyle(
                            color: context.colorPalette.grey8B8,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
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
              ResponsibleCard(task: task, assignedTasks: assignedTasksQuerySnapshot),
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
