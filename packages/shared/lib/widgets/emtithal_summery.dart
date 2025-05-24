import 'package:flutter/material.dart';
import 'package:shared/widgets/task_bubble.dart';

import '../enums/task_enums.dart';

class EmtithalSummery extends StatelessWidget {
  final int inCompletedTasksCount;
  final int completedTasksCount;
  final int lateTasksCount;
  final int violationTasksCount;

  const EmtithalSummery({
    super.key,
    required this.inCompletedTasksCount,
    required this.completedTasksCount,
    required this.lateTasksCount,
    required this.violationTasksCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        TaskBubble(taskType: TaskTypeEnum.incomplete, value: inCompletedTasksCount),
        TaskBubble(taskType: TaskTypeEnum.complete, value: completedTasksCount),
        TaskBubble(taskType: TaskTypeEnum.late, value: lateTasksCount),
        TaskBubble(taskType: TaskTypeEnum.infringement, value: violationTasksCount),
      ],
    );
  }
}
