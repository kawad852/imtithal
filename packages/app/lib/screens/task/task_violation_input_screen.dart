import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskViolationInputScreen extends StatefulWidget {
  const TaskViolationInputScreen({super.key});

  @override
  State<TaskViolationInputScreen> createState() => _TaskViolationInputScreenState();
}

class _TaskViolationInputScreenState extends State<TaskViolationInputScreen> {
  int _violationTaskIndex = 0;
  List<String> typeViolation() {
    return [
      context.appLocalization.nonCompliance,
      context.appLocalization.rejected,
      context.appLocalization.late,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        onPressed: () {},
        text: context.appLocalization.create,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        children: [
          Text(
            context.appLocalization.violationDetectedInTask,
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
          Row(
            children: [
              const BaseNetworkImage(
                "",
                width: 40,
                height: 40,
                shape: BoxShape.circle,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "مستشار مالي",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.grey8B8,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "محمد آل احمد",
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.typeOfViolation,
              child: Wrap(
                direction: Axis.horizontal,
                children:
                    typeViolation().map((item) {
                      return DayBubble(
                        onTap: () {
                          setState(() {
                            _violationTaskIndex = typeViolation().indexOf(item);
                          });
                        },
                        title: item,
                        isSelected: _violationTaskIndex == typeViolation().indexOf(item),
                        backgroundColor: _violationTaskIndex == typeViolation().indexOf(item)
                                ? context.colorPalette.redD62
                                : context.colorPalette.greyF5F,
                      );
                    }).toList(),
              ),
            ),
          ),
          TitledTextField(
            title: context.appLocalization.complianceOfficerNotesExplanations,
            child: TextEditor(
              onChanged: (value) {},
              hintText: context.appLocalization.complianceOfficerNotesExplanations,
              maxLines: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.penaltyForNonCompliance,
              child: TextEditor(
                onChanged: (value) {},
                hintText: context.appLocalization.descriptionPenaltyForNonCompliance,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const CustomSvg(MyIcons.attachSquare),
                const SizedBox(width: 11),
                Text(
                  context.appLocalization.attachFilesImages,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
