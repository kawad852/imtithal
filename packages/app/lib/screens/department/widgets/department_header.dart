import 'package:flutter_svg_provider/flutter_svg_provider.dart' as sv;
import 'package:shared/shared.dart';

class DepartmentHeader extends StatelessWidget {
  final DepartmentModel department;
  final UserModel? manager;
  final List<UserModel> users;

  const DepartmentHeader({
    super.key,
    required this.department,
    required this.users,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 365,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "${context.appLocalization.thisMonthComplianceAssessment} , ${context.appLocalization.since}  01.05.2025 ${context.appLocalization.toDay}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.colorPalette.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            children: [
              EvaluationBox(
                title: context.appLocalization.departmentComplianceAssessment,
                subTitle: "امتثال ممتاز",
                value: "59",
                color: context.colorPalette.primary,
              ),
              const SizedBox(width: 10),
              EvaluationBox(
                title: context.appLocalization.mostCompliantEmployee,
                isEmployee: true,
                subTitle: "احمد محمد",
                value: "96",
                color: context.colorPalette.primary,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              EvaluationBox(
                title: context.appLocalization.departmentComplianceAssessment,
                subTitle: context.appLocalization.monitoredViolations,
                value: "96",
                color: context.colorPalette.redD62,
              ),
              const SizedBox(width: 10),
              EvaluationBox(
                title: context.appLocalization.leastCompliantEmployee,
                isEmployee: true,
                subTitle: "عبدالله احمد",
                value: "96",
                color: context.colorPalette.redD62,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: EmtithalSummeryBuilder(departmentId: department.id),
          ),
          TextEditor(
            onChanged: (value) {},
            required: false,
            hintText: context.appLocalization.searchForEmployee,
            prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
          ),
        ],
      ),
    );
  }
}
