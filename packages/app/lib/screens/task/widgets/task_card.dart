import 'package:app/screens/task/task_details_screen.dart';
import 'package:app/screens/task/widgets/user_rail.dart';
import 'package:shared/shared.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final user = task.user != null ? UiHelper.getUser(task.user!.id) : null;
    return GestureDetector(
      onTap: () {
        context.navigate((context) => TaskDetailsScreen(task: task));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            if (user != null) ...[UserRail(lightUser: task.user!)],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          RepeatType.getLabel(task.repeatType!, context),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.grey8B8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (task.deliveryDate != null)
                        Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          margin: const EdgeInsetsDirectional.only(end: 4),
                          decoration: BoxDecoration(
                            color: context.colorPalette.greyECE,
                            borderRadius: BorderRadius.circular(kRadiusPrimary),
                          ),
                          child: Row(
                            children: [
                              CustomSvg(
                                MyIcons.calendar,
                                width: 14,
                                color: context.colorPalette.grey8B8,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                task.deliveryDate!.getDefaultFormattedDate(context),
                                style: TextStyle(
                                  color: context.colorPalette.grey8B8,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: context.colorPalette.greyECE,
                          borderRadius: BorderRadius.circular(kRadiusPrimary),
                        ),
                        child: Row(
                          children: [
                            const CustomSvg(MyIcons.clock),
                            const SizedBox(width: 4),
                            Text(
                              task.deliveryTime.convertStringToTimeOfDay.format(context),
                              style: TextStyle(
                                color: context.colorPalette.grey8B8,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.grey8B8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (user == null)
                        UsersSelector(
                          builder: (context, users) {
                            final assignedUsers =
                                users.where((e) => task.assignedUserIds.contains(e.id)).toList();
                            return UserPhotos(users: assignedUsers, height: 32);
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
