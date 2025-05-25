import 'package:flutter/material.dart';
import 'package:shared/widgets/task_bubble.dart';

import '../enums/task_enums.dart';

class EmtithalSummery extends StatelessWidget {
  final int inCompletedTasksCount;
  final int completedTasksCount;
  final int lateTasksCount;
  final int violationTasksCount;
  final bool isLoading;

  const EmtithalSummery({
    super.key,
    required this.inCompletedTasksCount,
    required this.completedTasksCount,
    required this.lateTasksCount,
    required this.violationTasksCount,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        TaskBubble(
          status: TaskStatusEnum.pending,
          value: isLoading ? '-' : "$inCompletedTasksCount",
        ),
        TaskBubble(
          status: TaskStatusEnum.completed,
          value: isLoading ? '-' : "$completedTasksCount",
        ),
        TaskBubble(
          status: TaskStatusEnum.pending,
          value: isLoading ? '-' : "$lateTasksCount",
          late: true,
        ),
        TaskBubble(
          status: TaskStatusEnum.violated,
          value: isLoading ? '-' : "$violationTasksCount",
        ),
      ],
    );
  }
}
