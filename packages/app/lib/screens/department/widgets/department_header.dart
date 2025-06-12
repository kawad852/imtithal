import 'package:app/screens/task/widgets/summery/summery_label.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as sv;
import 'package:shared/shared.dart';

import '../../search/search_screen.dart';
import '../../task/widgets/summery/status_summery_bubbles.dart';
import '../../task/widgets/summery/summery_builder.dart';

class DepartmentHeader extends StatelessWidget {
  final DepartmentModel department;
  final UserModel? manager;
  final List<UserModel> users;
  final DateTime startDate;
  final DateTime endDate;

  const DepartmentHeader({
    super.key,
    required this.department,
    required this.users,
    required this.manager,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(image: sv.Svg(MyIcons.departmentBackground), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${context.appLocalization.department} ${department.name}",
            style: TextStyle(
              color: context.colorPalette.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "${users.length} ${context.appLocalization.employee} , ${context.appLocalization.responsibleManager}: ",
                style: TextStyle(
                  color: context.colorPalette.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Text(
                  manager?.displayName ?? "-",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SummeryBuilder(
            height: 225,
            departmentId: department.id,
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
                  if (users.$1 != null && users.$2 != null)
                    Row(
                      spacing: 10,
                      children: [
                        EvaluationBox(
                          title: context.appLocalization.mostCompliantEmployee,
                          isEmployee: true,
                          subTitle: users.$1!.displayName,
                          profilePhoto: users.$1!.profilePhoto,
                          value: "${users.$1!.imtithalPercentage}%",
                          color: context.colorPalette.primary,
                        ),
                        EvaluationBox(
                          title: context.appLocalization.leastCompliantEmployee,
                          isEmployee: true,
                          subTitle: users.$2!.displayName,
                          profilePhoto: users.$2!.profilePhoto,
                          value: "${users.$2!.violatedCount}",
                          color: context.colorPalette.redD62,
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  StatusSummeryBubbles(
                    inCompletedTasksCount: inCompletedTasks.$1,
                    completedTasksCount: completedTasks.$1,
                    lateTasksCount: lateTasks.$1,
                    violationTasksCount: violationTasks.$1,
                    departmentId: department.id,
                    startDate: startDate,
                    endDate: endDate,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          SearchScreen(
            hintText: context.appLocalization.searchForEmployee,
            includeIndexes: (true, false, false, false),
            filters: '${MyFields.departmentId}:${department.id}',
          ),
        ],
      ),
    );
  }
}
