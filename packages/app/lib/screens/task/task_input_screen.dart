import 'package:app/screens_exports.dart' show DayBubble;
import 'package:shared/shared.dart';

class TaskInputScreen extends StatefulWidget {
  const TaskInputScreen({super.key});

  @override
  State<TaskInputScreen> createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  int _repetitionTaskIndex = 0;
  int _dayIndex = 0;
  List<String> taskRepetition() {
    return [
      context.appLocalization.daily,
      context.appLocalization.weekly,
      context.appLocalization.monthly,
      context.appLocalization.noRepetition,
    ];
  }

  List<String> dayWeek() {
    return [
      context.appLocalization.saturday,
      context.appLocalization.sunday,
      context.appLocalization.monday,
      context.appLocalization.tuesday,
      context.appLocalization.wednesday,
      context.appLocalization.thursday,
      context.appLocalization.friday,
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
            context.appLocalization.addNewTask,
            style: TextStyle(
              color: context.colorPalette.black252,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          TitledTextField(
            title: context.appLocalization.taskTitle,
            child: TextEditor(
              onChanged: (value) {},
              hintText: context.appLocalization.taskTitleToComplyWith,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.taskDescription,
              child: TextEditor(
                onChanged: (value) {},
                hintText: context.appLocalization.requiredTaskDescription,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TitledTextField(
                  title: context.appLocalization.deliveryTime,
                  child: TextEditor(
                    onChanged: (value) {},
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TitledTextField(
                  title: context.appLocalization.gracePeriod,
                  child: TextEditor(
                    onChanged: (value) {},
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.taskRepetition,
              child: Wrap(
                direction: Axis.horizontal,
                children:
                    taskRepetition().map((item) {
                      return DayBubble(
                        onTap: () {
                          setState(() {
                            _repetitionTaskIndex = taskRepetition().indexOf(item);
                          });
                        },
                        title: item,
                        isSelected: _repetitionTaskIndex == taskRepetition().indexOf(item),
                        backgroundColor: _repetitionTaskIndex == taskRepetition().indexOf(item)
                                ? context.colorPalette.primary
                                : context.colorPalette.greyF5F,
                      );
                    }).toList(),
              ),
            ),
          ),
          TitledTextField(
            title: context.appLocalization.specifyTheDayForTaskRepetition,
            child: Wrap(
              direction: Axis.horizontal,
              children:
                  dayWeek().map((item) {
                    return DayBubble(
                      onTap: () {
                        setState(() {
                          _dayIndex = dayWeek().indexOf(item);
                        });
                      },
                      title: item,
                      isSelected: _dayIndex == dayWeek().indexOf(item),
                      backgroundColor: _dayIndex == dayWeek().indexOf(item)
                              ? context.colorPalette.black252
                              : context.colorPalette.greyF5F,
                    );
                  }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.notesAboutTheTask,
              child: TextEditor(
                onChanged: (value) {},
                hintText: context.appLocalization.notesAboutTheTaskExecutionMechanism,
              ),
            ),
          ),
          TitledTextField(
            title: context.appLocalization.penaltyForNonCompliance,
            child: TextEditor(
              onChanged: (value) {},
              hintText: context.appLocalization.descriptionPenaltyForNonCompliance,
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const CustomSvg(MyIcons.attachSquare),
                const SizedBox(width: 11),
                Text(
                  context.appLocalization.attachFiles,
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
