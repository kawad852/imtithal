import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';
import 'package:shared/widgets/editors/nav_editor.dart';

import '../user/users_selection_screen.dart';

class ViolationInputScreen extends StatefulWidget {
  final TaskModel? task;

  const ViolationInputScreen({super.key, required this.task});

  @override
  State<ViolationInputScreen> createState() => _ViolationInputScreenState();
}

class _ViolationInputScreenState extends State<ViolationInputScreen> {
  late ViolationModel _violation;
  final _formKey = GlobalKey<FormState>();
  List<UserModel> _selectedUsers = [];

  List<String> get _userIds => _selectedUsers.map((e) => e.id!).toList();

  TaskModel? get _task => widget.task;
  UserModel? get _user => widget.task?.userModel;
  bool get _isGeneralViolation => _task == null;

  Future<void> _onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          _violation.id = kUUID;
          _violation.createdAt = kNowDate;
          _violation.companyId = kCompanyId;
          final batch = kFirebaseInstant.batch();
          if (_isGeneralViolation) {
            for (var user in _selectedUsers) {
              final violationDocRef = kFirebaseInstant.userViolations(user.id!).doc(_violation.id);
              _violation.user = LightUserModel(departmentId: user.departmentId, id: user.id!);
              batch.set(violationDocRef, _violation);
              _sendNotification(context, user: user);
            }
          } else {
            _violation.user = LightUserModel(departmentId: _user!.departmentId!, id: _user!.id!);
            final taskDocRef = kFirebaseInstant.userAssignedTasks(_user!.id!).doc(_task!.id);
            final violationDocRef = kFirebaseInstant.userViolations(_user!.id!).doc(_violation.id);
            batch.set(violationDocRef, _violation);
            batch.update(taskDocRef, {
              MyFields.status: TaskStatusEnum.violated.value,
              MyFields.violation:
                  LightViolationModel(id: _violation.id, type: _violation.type).toJson(),
            });
            _sendNotification(context, user: _user!);
          }
          await batch.commit();
          if (context.mounted) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: context.appLocalization.savedSuccessfully);
          }
        },
      );
    }
  }

  void _sendNotification(BuildContext context, {required UserModel user}) {
    SendNotificationService.sendToUser(
      context,
      userId: user.id!,
      deviceToken: user.deviceToken!,
      languageCode: user.languageCode,
      id: _violation.id,
      type: NotificationType.violation.value,
      titleEn: "Task Violation",
      titleAr: "تم تسجيل مخالفة على المهمة",
      bodyEn:
          "A violation has been recorded for the assigned task. Please review and take corrective action.",
      bodyAr: "تم تسجيل مخالفة على المهمة الموكلة إليك. يرجى المراجعة واتخاذ الإجراءات اللازمة",
    );
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
          if (_isGeneralViolation && _selectedUsers.isEmpty) {
            context.showSnackBar(context.appLocalization.selectEmployees);
            return;
          }
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
                _isGeneralViolation
                    ? context.appLocalization.generalViolation
                    : context.appLocalization.violationDetectedInTask,
                style: TextStyle(
                  color: context.colorPalette.redD62,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (_isGeneralViolation) ...[
                const SizedBox(height: 10),
                NavEditor(
                  onTap: () {
                    context
                        .push((context) {
                          return UsersSelectionScreen(userIds: _userIds);
                        })
                        .then((value) {
                          if (value != null && context.mounted) {
                            setState(() {
                              _selectedUsers = value;
                            });
                          }
                        });
                  },
                  labelText: context.appLocalization.employees,
                  suffixIcon: const Icon(Icons.arrow_forward_ios, size: 14),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(_selectedUsers.length, (index) {
                    final user = _selectedUsers[index];
                    return Chip(
                      label: Text(user.displayName),
                      onDeleted: () {
                        setState(() {
                          _selectedUsers.removeAt(index);
                        });
                      },
                    );
                  }),
                ),
              ],

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
                        (_isGeneralViolation
                                ? [ViolationType.nonCompliance, ViolationType.generalSafety]
                                : ViolationType.values.where(
                                  (e) => e != ViolationType.generalSafety,
                                ))
                            .map((e) {
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
                            })
                            .toList(),
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
