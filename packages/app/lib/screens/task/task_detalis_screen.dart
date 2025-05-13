import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskDetalisScreen extends StatefulWidget {
  const TaskDetalisScreen({super.key});

  @override
  State<TaskDetalisScreen> createState() => _TaskDetalisScreenState();
}

class _TaskDetalisScreenState extends State<TaskDetalisScreen> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.colorPalette.grey8B8,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        children: [
          Text(
            "تقارير المحاميين للعمل الميداني",
            style: TextStyle(
              color: context.colorPalette.black252,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Container(
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: context.colorPalette.primary,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: Text(
                  "مكتملة",
                  style: TextStyle(
                    color: context.colorPalette.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "تزويد الإدارة بتقارير حول العمل الميداني الذي قام به المحامي في فترة خروجهه للميدان ويعتبر هذا وصف للمهمة ويقوم مدير الإمثتال او الإدارة بإدخاله في المهمة",
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              context.appLocalization.notesAboutTheTask,
              style: TextStyle(
                color: context.colorPalette.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            "ملاحظات حول الية التسليم وكيفية تنفيذ المهمة او اي ملاحظة توجهها الإدارة للموظف المسؤول",
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "${context.appLocalization.attachedFiles} (2)",
              style: style.copyWith(
                color: context.colorPalette.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              context.appLocalization.penaltyForNonCompliance,
              style: style.copyWith(
                color: context.colorPalette.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text("انذار خطي وخصم 1%", style: style),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              context.appLocalization.timeRemainingUntilDeadline,
              style: style.copyWith(
                color: context.colorPalette.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              TimeCard(title: context.appLocalization.second, value: "02"),
              const SizedBox(width: 10),
              TimeCard(title: context.appLocalization.minute, value: "02"),
              const SizedBox(width: 10),
              TimeCard(title: context.appLocalization.hour, value: "02"),
              const SizedBox(width: 10),
              TimeCard(title: context.appLocalization.day, value: "02"),
            ],
          ),
          const ResponsibleCard(),
          const Row(
            children: [
              TaskBubble(taskType: TaskTypeEnum.incomplete, value: "11"),
              SizedBox(width: 10),
              TaskBubble(taskType: TaskTypeEnum.complete, value: "13"),
              SizedBox(width: 10),
              TaskBubble(taskType: TaskTypeEnum.late, value: "15"),
              SizedBox(width: 10),
              TaskBubble(taskType: TaskTypeEnum.infringement, value: "16"),
            ],
          ),
        ],
      ),
    );
  }
}
