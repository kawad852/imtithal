import 'package:app/screens_exports.dart' show DayBubble, TaskDetailsScreen;
import 'package:shared/shared.dart';

class TaskInputScreen extends StatefulWidget {
  final TaskModel? task;

  const TaskInputScreen({super.key, this.task});

  @override
  State<TaskInputScreen> createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  late TaskModel _task;
  final _formKey = GlobalKey<FormState>();
  final List<Object> _files = [];
  final _storageService = StorageService();

  bool get _isEdit => widget.task != null;

  Future<void> _onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          final isAdd = _task.id.isEmpty;
          if (isAdd) {
            _task.id = await RowIdHelper().getTaskId();
            _task.createdAt = kNowDate;
          }
          final time = _task.deliveryTime.convertStringToTimeOfDay;
          _task.deliveryDate = _task.deliveryDate?.copyWith(
            hour: time.hour,
            minute: time.minute,
            second: 0,
          );
          final taskDocRef = kFirebaseInstant.tasks.doc(_task.id);
          if (_files.whereType<XFile>().isNotEmpty) {
            final files = await _storageService.uploadFiles(MyCollections.tasks, _files);
            _task.attachments = [..._task.attachments!, ...files];
          }
          taskDocRef.set(_task);
          if (context.mounted) {
            if (isAdd) {
              context.pushReplacement2((context) {
                return TaskDetailsScreen(task: _task);
              });
            } else {
              Navigator.pop(context);
              Fluttertoast.showToast(msg: context.appLocalization.savedSuccessfully);
            }
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _task = TaskModel.fromJson(
      widget.task?.toJson() ??
          TaskModel(
            status: TaskStatusEnum.pending.value,
            companyId: kCompanyId,
            attachments: [],
            weeklyDays: [],
            monthlyDays: [],
            createdById: kUserId,
            user: null,
          ).toJson(),
    );
    if (_task.attachments != null) {
      _files.addAll(_task.attachments!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        onPressed: () {
          _onSubmit(context);
        },
        text: _isEdit ? context.appLocalization.save : context.appLocalization.create,
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
                  initialValue: _task.title,
                  onChanged: (value) => _task.title = value!,
                  hintText: context.appLocalization.taskTitleToComplyWith,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TitledTextField(
                  title: context.appLocalization.taskDescription,
                  child: TextEditor(
                    initialValue: _task.description,
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
                        initialValue: _task.deliveryTime.isNotEmpty ? _task.deliveryTime : null,
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
                        initialValue: _task.allowedDurationInMinutes,
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
                                  _task.weeklyDays.clear();
                                  _task.monthlyDays.clear();
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
              if (_task.repeatType == RepeatType.once.value)
                TitledTextField(
                  title: context.appLocalization.deliveryDate,
                  child: DatePickerEditor(
                    value: _task.deliveryDate,
                    onChanged: (value) => _task.deliveryDate = value,
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
                          final isSelected = _task.weeklyDays.contains(e);
                          return DayBubble(
                            onTap: () {
                              setState(() {
                                if (_task.weeklyDays.contains(e)) {
                                  _task.weeklyDays.remove(e);
                                } else {
                                  _task.weeklyDays.add(e);
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
              if (_task.repeatType == RepeatType.monthly.value)
                SizedBox(
                  height: 40,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          List.generate(31, (index) {
                            final value = '${index + 1}';
                            return InputChip(
                              label: Text(value),
                              selected: _task.monthlyDays.contains(value),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _task.monthlyDays.add(value);
                                  } else {
                                    _task.monthlyDays.remove(value);
                                  }
                                });
                              },
                            );
                          }).separator(const SizedBox(width: 5)).toList(),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TitledTextField(
                  title: context.appLocalization.notesAboutTheTask,
                  child: TextEditor(
                    initialValue: _task.notes,
                    onChanged: (value) => _task.notes = value!,
                    hintText: context.appLocalization.notesAboutTheTaskExecutionMechanism,
                  ),
                ),
              ),
              TitledTextField(
                title: context.appLocalization.penaltyForNonCompliance,
                child: TextEditor(
                  initialValue: _task.violationDescription,
                  onChanged: (value) => _task.violationDescription = value!,
                  hintText: context.appLocalization.descriptionPenaltyForNonCompliance,
                ),
              ),
              const SizedBox(height: 15),
              ImagesAttacher(
                files: _files,
                onChanged: (files) {
                  _files.addAll(files);
                },
              ),
              // if (_files.isNotEmpty) AttachmentsList(files: _files),
            ],
          ),
        ),
      ),
    );
  }
}
