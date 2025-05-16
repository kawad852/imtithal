import 'package:app/screens_exports.dart' show DayBubble;
import 'package:shared/shared.dart';

class TaskInputScreen extends StatefulWidget {
  const TaskInputScreen({super.key});

  @override
  State<TaskInputScreen> createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  late TaskModel _task;
  final _formKey = GlobalKey<FormState>();
  final List<XFile> _files = [];

  Future<void> _onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
    }
  }

  @override
  void initState() {
    super.initState();
    _task = TaskModel(companyId: '', attachments: [], repeatDays: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        onPressed: () {
          _onSubmit(context);
        },
        text: context.appLocalization.create,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  onChanged: (value) => _task.title = value!,
                  hintText: context.appLocalization.taskTitleToComplyWith,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TitledTextField(
                  title: context.appLocalization.taskDescription,
                  child: TextEditor(
                    onChanged: (value) => _task.description = value!,
                    hintText: context.appLocalization.requiredTaskDescription,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TitledTextField(
                      title: context.appLocalization.deliveryTime,
                      child: DayTimeEditor(
                        initialValue: null,
                        onChanged: (value) => _task.deliveryTime = value,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TitledTextField(
                      title: context.appLocalization.gracePeriod,
                      child: NumbersEditor(
                        suffixIcon: Text(
                          "   ${context.appLocalization.minute}   ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: context.colorPalette.primary,
                          ),
                        ),
                        onChanged: (value) => _task.allowedDurationInMinutes = value!,
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
                        RepeatType.values.map((e) {
                          final isSelected = _task.repeatType == e.value;
                          return DayBubble(
                            onTap: () {
                              if (_task.repeatType != e.value) {
                                setState(() {
                                  _task.repeatType = e.value;
                                  _task.repeatDays.clear();
                                });
                              }
                            },
                            title: RepeatType.getLabel(e.value, context),
                            isSelected: isSelected,
                            backgroundColor:
                                isSelected
                                    ? context.colorPalette.primary
                                    : context.colorPalette.greyF5F,
                          );
                        }).toList(),
                  ),
                ),
              ),
              if (_task.repeatType == RepeatType.weekly.value)
                TitledTextField(
                  title: context.appLocalization.specifyTheDayForTaskRepetition,
                  child: Wrap(
                    direction: Axis.horizontal,
                    children:
                        TaskDaysEnum.values.map((day) {
                          final e = day.value;
                          final isSelected = _task.repeatDays.contains(e);
                          return DayBubble(
                            onTap: () {
                              setState(() {
                                if (_task.repeatDays.contains(e)) {
                                  _task.repeatDays.remove(e);
                                } else {
                                  _task.repeatDays.add(e);
                                }
                              });
                            },
                            title: TaskDaysEnum.getLabel(e, context),
                            isSelected: isSelected,
                            backgroundColor:
                                isSelected
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
              ImagesAttacher(
                onChanged: (files) {
                  _files.addAll(files);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
