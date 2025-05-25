import 'package:flutter_svg_provider/flutter_svg_provider.dart' as sv;
import 'package:shared/shared.dart';

class UserHeader extends StatelessWidget {
  final UserModel user;
  const UserHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
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
          Text(
            "${context.appLocalization.thisMonthComplianceAssessment} , ${context.appLocalization.since}  01.05.2025 ${context.appLocalization.toDay}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.colorPalette.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                EvaluationBox(
                  title: context.appLocalization.complianceAssessment,
                  subTitle: "امتثال ممتاز",
                  value: "59",
                  color: context.colorPalette.primary,
                ),
                const SizedBox(width: 10),
                EvaluationBox(
                  title: context.appLocalization.departmentComplianceAssessment,
                  subTitle: context.appLocalization.monitoredViolations,
                  value: "96",
                  color: context.colorPalette.redD62,
                ),
              ],
            ),
          ),
          EmtithalSummeryBuilder(userId: user.id),
        ],
      ),
    );
  }
}
