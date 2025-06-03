import 'package:flutter_svg_provider/flutter_svg_provider.dart' as sv;
import 'package:shared/shared.dart';

import '../../task/widgets/summery/status_summery_bubbles.dart';
import '../../task/widgets/summery/summery_builder.dart';
import '../../task/widgets/summery/summery_label.dart';

class UserHeader extends StatelessWidget {
  final UserModel user;
  final DateTime startDate;
  final DateTime endDate;

  const UserHeader({super.key, required this.user, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(image: sv.Svg(MyIcons.employeeBackground), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 70),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.displayName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: DepartmentUserBuilder(
                        id: user.departmentId!,
                        builder: (context, department) {
                          return Text(
                            "${user.jobTitle} - ${department?.name ?? ''}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: context.colorPalette.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "${context.appLocalization.employeeNo} : 56",
                      overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 10),
          SummeryBuilder(
            height: 160,
            userId: user.id,
            startDate: startDate,
            endDate: endDate,
            builder: (
              (int, double) inCompletedTasks,
              (int, double) completedTasks,
              (int, double) violationTasks,
              (int, double) lateTasks,
              users,
              percentageValues,
            ) {
              return Column(
                children: [
                  SummeryLabel(startDate: startDate, endDate: endDate, values: percentageValues),
                  StatusSummeryBubbles(
                    inCompletedTasksCount: inCompletedTasks.$1,
                    completedTasksCount: completedTasks.$1,
                    lateTasksCount: lateTasks.$1,
                    violationTasksCount: violationTasks.$1,
                    userId: user.id,
                    startDate: startDate,
                    endDate: endDate,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
