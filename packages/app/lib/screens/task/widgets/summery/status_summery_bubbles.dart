import 'package:flutter/material.dart';
import 'package:shared/enums/task_enums.dart';
import 'package:shared/widgets/task_bubble.dart';

class StatusSummeryBubbles extends StatelessWidget {
  final int inCompletedTasksCount;
  final int completedTasksCount;
  final int lateTasksCount;
  final int violationTasksCount;
  final bool isLoading;
  final String? userId;
  final String? departmentId;
  final DateTime startDate;
  final DateTime endDate;

  const StatusSummeryBubbles({
    super.key,
    required this.inCompletedTasksCount,
    required this.completedTasksCount,
    required this.lateTasksCount,
    required this.violationTasksCount,
    this.isLoading = false,
    this.userId,
    this.departmentId,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        TaskBubble(
          status: TaskStatusEnum.pending,
          value: isLoading ? '-' : "$inCompletedTasksCount",
          userId: userId,
          departmentId: departmentId,
          startDate: startDate,
          endDate: endDate,
        ),
        TaskBubble(
          status: TaskStatusEnum.completed,
          value: isLoading ? '-' : "$completedTasksCount",
          userId: userId,
          departmentId: departmentId,
          startDate: startDate,
          endDate: endDate,
        ),
        TaskBubble(
          status: TaskStatusEnum.pending,
          value: isLoading ? '-' : "$lateTasksCount",
          userId: userId,
          departmentId: departmentId,
          startDate: startDate,
          endDate: endDate,
          late: true,
        ),
        TaskBubble(
          status: TaskStatusEnum.violated,
          value: isLoading ? '-' : "$violationTasksCount",
          userId: userId,
          departmentId: departmentId,
          startDate: startDate,
          endDate: endDate,
        ),
      ],
    );
  }
}
