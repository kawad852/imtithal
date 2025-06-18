import 'package:shared/shared.dart';

import '../../violation/violation_input_screen.dart';

class ImtithalButton extends StatelessWidget {
  final TaskModel assignedTask;
  final UserModel user;

  const ImtithalButton({super.key, required this.assignedTask, required this.user});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const CustomSvg(MyIcons.moreCircle),
      onSelected: (value) {
        if (value) {
          kFirebaseInstant.userAssignedTasks(user.id!).doc(assignedTask.id).update({
            MyFields.status: TaskStatusEnum.completed.value,
            MyFields.points: TaskPoints.imtithal.value,
          });
          SendNotificationService.sendToUser(
            context,
            userId: user.id!,
            deviceToken: user.deviceToken,
            languageCode: user.languageCode,
            id: assignedTask.id,
            type: NotificationType.emtithal.value,
            titleEn: "✅ Task Complied Successfully",
            titleAr: "تم الإمتثال للمهمة بنجاح ✅",
            bodyEn:
                "You have successfully complied with the task requirements. Keep up the good work!",
            bodyAr: "لقد قمت بالإمتثال لمتطلبات المهمة بنجاح. استمر في الأداء الجيد",
          );
        } else {
          context.navigate((context) {
            return ViolationInputScreen(task: assignedTask);
          });
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(value: true, child: Text(context.appLocalization.imtithal)),
          PopupMenuItem(value: false, child: Text(context.appLocalization.nonCompliance)),
        ];
      },
    );
  }
}
