import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class ViolationSingleScreen extends StatefulWidget {
  const ViolationSingleScreen({super.key});

  @override
  State<ViolationSingleScreen> createState() => _ViolationSingleScreenState();
}

class _ViolationSingleScreenState extends State<ViolationSingleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        onPressed: () {
          context.showBottomSheet(
            context,
            maxHeight: 401,
            builder: (context) {
              return const ReplySheet();
            },
          );
        },
        text: context.appLocalization.addReply,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        children: [
          Text(
            context.appLocalization.violationObservedInTask,
            style: TextStyle(
              color: context.colorPalette.redD62,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "تقارير المحاميين للعمل الميداني ",
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const ViolationInfo(),
          Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: context.colorPalette.greyF5F,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.appLocalization.finalAdministrativeDecision,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          CustomSvg(MyIcons.clock, color: context.colorPalette.grey8B8, width: 16),
                          const SizedBox(width: 10),
                          Text(
                            "03:30 مساءً",
                            style: TextStyle(
                              color: context.colorPalette.grey8B8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomSvg(
                            MyIcons.calendar,
                            color: context.colorPalette.grey8B8,
                            width: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "01.05.2025",
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
                ViolationTypeWidget(
                  title: "تم الإلغاء",
                  backgroundColor: context.colorPalette.primary,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.typeOfViolation,
              child: Row(
                children: [
                  ViolationTypeWidget(
                    title: "عدم امتثال",
                    backgroundColor: context.colorPalette.redD62,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "${context.appLocalization.complianceOfficerNotesExplanations} : ",
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Text(
                  "صهيب العجارمة",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "لم يتم تسليم المهمة في الوقت المناسب وعليه تم ضبط عدم امتثال من قبل الاستاذ محممد",
              style: TextStyle(
                color: context.colorPalette.grey8B8,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            context.appLocalization.penaltyForNonCompliance,
            style: TextStyle(
              color: context.colorPalette.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "انذار اول وخصم 1% وفي حال تكرار ستكون انذار ثاني وخصم 2%",
              style: TextStyle(
                color: context.colorPalette.grey8B8,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            "${context.appLocalization.attachedFiles} (2)",
            style: TextStyle(
              color: context.colorPalette.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyF5F,
                    borderRadius: BorderRadius.circular(kRadiusSecondary),
                  ),
                  child: Text(
                    "1332.pdf",
                    style: TextStyle(
                      color: context.colorPalette.grey8B8,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(color: context.colorPalette.grey8B8),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              return const ReplyCard();
            },
          ),
        ],
      ),
    );
  }
}
