import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel? task;
  final String? id;

  const TaskDetailsScreen({super.key, this.task, this.id});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late Stream<List<dynamic>> _streams;

  String get _taskId => widget.id ?? widget.task!.id;

  void _initialize() {
    final taskQuery = context.taskProvider.getTaskDocRef(_taskId);
    var assignedTasksQuery = context.taskProvider.getAssignedTasksQuery(_taskId).limit(10);
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
        final assignedTasks = assignedTasksQuerySnapshot.docs;
        return Scaffold(
          appBar: AppBar(),
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
              Row(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                ],
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
              if (task.attachments.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${context.appLocalization.attachedFiles} (${task.attachments.length})",
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
                    itemCount: task.attachments.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final attachment = task.attachments[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.colorPalette.greyF5F,
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                        ),
                        child: Text(
                          attachment,
                          style: TextStyle(
                            color: context.colorPalette.grey8B8,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
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
              Text(task.penaltyDescription, style: style),
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
              Row(
                children: [
                  TimeCard(title: context.appLocalization.second, value: "02"),
                  const SizedBox(width: 10),
                  TimeCard(title: context.appLocalization.minute, value: "02"),
                  const SizedBox(width: 10),
                  TimeCard(title: context.appLocalization.hour, value: "02"),
                  const SizedBox(width: 10),
                  TimeCard(title: context.appLocalization.day, value: "02"),
                ],
              ),
              if (!kIsEmployee) ...[
                ResponsibleCard(task: task, assignedTasks: assignedTasksQuerySnapshot),
                EmtithalSummery(
                  user: UserModel(
                    inCompletedTasksCount: task.inCompletedTasksCount,
                    completedTasksCount: task.completedTasksCount,
                    lateTasksCount: task.lateTasksCount,
                    penaltyTasksCount: task.penaltyTasksCount,
                    createdById: kUserId,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
