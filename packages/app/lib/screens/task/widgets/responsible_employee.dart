import 'package:shared/shared.dart';

import '../../violation/violation_input_screen.dart';

class ResponsibleEmployee extends StatelessWidget {
  final TaskModel assignedTask;

  const ResponsibleEmployee({super.key, required this.assignedTask});

  @override
  Widget build(BuildContext context) {
    final user = assignedTask.userModel!;
    final indicatorColor = assignedTask.indicatorColor(context);
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF5F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          VerticalLine(height: 40, color: indicatorColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomSvg(MyIcons.check, color: indicatorColor),
          ),
          UserPhoto(url: user.profilePhoto, displayName: user.displayName),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.jobTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.grey8B8,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.displayName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            icon: const CustomSvg(MyIcons.moreCircle),
            onSelected: (value) {
              if (value) {
                kFirebaseInstant.assignedTasks.doc(assignedTask.id).update({
                  MyFields.status: TaskStatusEnum.completed.value,
                });
              } else {
                context.push((context) {
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
          ),
          // Container(
          //   height: 30,
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   decoration: BoxDecoration(
          //     color: context.colorPalette.yellowE7B6,
          //     borderRadius: BorderRadius.circular(kRadiusPrimary),
          //   ),
          //   child: Row(
          //     children: [
          //       const CustomSvg(MyIcons.danger, width: 20),
          //       Text(
          //         "عدم امتثال",
          //         style: TextStyle(
          //           color: context.colorPalette.black,
          //           fontSize: 12,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
