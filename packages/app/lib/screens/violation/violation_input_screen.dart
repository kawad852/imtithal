import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationInputScreen extends StatefulWidget {
  final TaskModel? task;

  const ViolationInputScreen({super.key, required this.task});

  @override
  State<ViolationInputScreen> createState() => _ViolationInputScreenState();
}

class _ViolationInputScreenState extends State<ViolationInputScreen> {
  late ViolationModel _violation;
  final _formKey = GlobalKey<FormState>();

  TaskModel? get _task => widget.task;
  LightUserModel? get _user => widget.task?.user;
  bool get _isGeneralViolation => _task == null;

  Future<void> _onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          _violation.id = kUUID;
          _violation.createdAt = kNowDate;
          final userId = _task!.user!.id;
          if (!_isGeneralViolation) {
            final batch = kFirebaseInstant.batch();
            final taskDocRef = kFirebaseInstant.userAssignedTasks(userId).doc(_task!.id);
            final violationDocRef = kFirebaseInstant.userViolations(userId).doc(_violation.id);
            batch.update(taskDocRef, {
              MyFields.status: TaskStatusEnum.violated.value,
              MyFields.violation:
                  LightViolationModel(id: _violation.id, type: _violation.type).toJson(),
            });
            violationDocRef.set(_violation);
            await batch.commit();
            if (context.mounted) {
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
    _violation = ViolationModel(createdById: kUserId);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.appLocalization.violationDetectedInTask,
                style: TextStyle(
                  color: context.colorPalette.redD62,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (!_isGeneralViolation)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    _task!.title,
                    style: TextStyle(
                      color: context.colorPalette.black252,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              if (!_isGeneralViolation)
                UsersSelector(
                  builder: (context, users) {
                    _task!.userModel ??= users.firstWhere(
                      (e) => e.id == _task!.user?.id,
                      orElse: () => UserModel(),
                    );
                    return Row(
                      children: [
                        UserPhoto(
                          url: _task!.userModel?.profilePhoto,
                          displayName: _task?.userModel?.displayName ?? '',
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _task?.userModel?.jobTitle ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: context.colorPalette.grey8B8,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _task?.userModel?.displayName ?? '',
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
                    );
                  },
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TitledTextField(
                  title: context.appLocalization.typeOfViolation,
                  child: Wrap(
                    direction: Axis.horizontal,
                    children:
                        ViolationType.values.map((e) {
                          final selected = _violation.type == e.value;
                          return DayBubble(
                            onTap: () {
                              setState(() {
                                _violation.type = e.value;
                              });
                            },
                            title: ViolationType.getLabel(e.value, context),
                            isSelected: selected,
                            backgroundColor:
                                selected
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
                  onChanged: (value) => _violation.notes = value!,
                  hintText: context.appLocalization.complianceOfficerNotesExplanations,
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TitledTextField(
                  title: context.appLocalization.penaltyForNonCompliance,
                  child: TextEditor(
                    onChanged: (value) => _violation.description = value!,
                    hintText: context.appLocalization.descriptionPenaltyForNonCompliance,
                  ),
                ),
              ),
              ImagesAttacher(
                onChanged: (files) {},
                title: context.appLocalization.attachFilesImages,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
