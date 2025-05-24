import 'package:app/screens/task/widgets/assigned_list.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class ResponsibleCard extends StatelessWidget {
  final TaskModel task;
  final QuerySnapshot<TaskModel> assignedTasks;

  const ResponsibleCard({super.key, required this.task, required this.assignedTasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF5F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${context.appLocalization.responsibleParties} ",
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "(${task.totalAssignedUsers})",
                      style: TextStyle(
                        color: context.colorPalette.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      if (assignedTasks.docs.isNotEmpty)
                        Expanded(child: AssignedList(assignedTasks: assignedTasks, height: 32)),
                      GestureDetector(
                        onTap: () {
                          context.push(
                            (context) => TaskActionScreen(task: task, assignedTasks: assignedTasks),
                          );
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: context.colorPalette.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const CustomSvg(MyIcons.setting),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(color: context.colorPalette.grey8B8, indent: 12, endIndent: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.appLocalization.deliveryDateTime,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSvg(MyIcons.clock, color: context.colorPalette.grey8B8, width: 16),
                      const SizedBox(width: 10),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvg(MyIcons.calendar, color: context.colorPalette.grey8B8, width: 16),
                    const SizedBox(width: 10),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
