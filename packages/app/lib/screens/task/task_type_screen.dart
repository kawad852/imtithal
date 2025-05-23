import 'package:app/screens/task/widgets/task_card.dart';
import 'package:shared/shared.dart';

class TaskTypeScreen extends StatefulWidget {
  final TaskTypeEnum taskType;
  const TaskTypeScreen({super.key, required this.taskType});

  @override
  State<TaskTypeScreen> createState() => _TaskTypeScreenState();
}

class _TaskTypeScreenState extends State<TaskTypeScreen> {
  (String, Color) _getTaskInfo(BuildContext context) {
    switch (widget.taskType) {
      case TaskTypeEnum.incomplete:
        return (context.appLocalization.incompleteTasks, context.colorPalette.greyDAD);
      case TaskTypeEnum.complete:
        return (context.appLocalization.completedTasks, context.colorPalette.green04B);
      case TaskTypeEnum.late:
        return (context.appLocalization.lateTasks, context.colorPalette.yellowE7B);
      case TaskTypeEnum.infringement:
        return (context.appLocalization.monitoredViolations, context.colorPalette.redD62);
    }
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
              "${task.$1} - عبد الله محمد",
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: 10,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return TaskCard(
                    task: TaskModel(
                      repeatDays: [],
                      attachments: [],
                      companyId: '',
                      createdById: '',
                    ),
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
