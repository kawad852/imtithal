import 'package:flutter/material.dart';
import 'package:shared/models/user/user_model.dart';
import 'package:shared/widgets/task_bubble.dart';

import '../enums/task_enums.dart';

class EmtithalSummery extends StatelessWidget {
  final UserModel user;

  const EmtithalSummery({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        TaskBubble(taskType: TaskTypeEnum.incomplete, value: user.inCompletedTasksCount),
        TaskBubble(taskType: TaskTypeEnum.complete, value: user.completedTasksCount),
        TaskBubble(taskType: TaskTypeEnum.late, value: user.lateTasksCount),
        TaskBubble(taskType: TaskTypeEnum.infringement, value: user.penaltyTasksCount),
      ],
    );
  }
}
