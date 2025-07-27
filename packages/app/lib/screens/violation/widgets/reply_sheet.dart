import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ReplySheet extends StatefulWidget {
  final DocumentReference<ViolationModel> violationDocRef;
  final CollectionReference<ViolationReplyModel> replyCollectionRef;
  final LightUserModel user;
  final String status;

  const ReplySheet({
    super.key,
    required this.violationDocRef,
    required this.replyCollectionRef,
    required this.user,
    required this.status,
  });

  @override
  State<ReplySheet> createState() => _ReplySheetState();
}

class _ReplySheetState extends State<ReplySheet> {
  final _reply = ViolationReplyModel();
  final _formKey = GlobalKey<FormState>();
  final _storageService = StorageService();
  final List<Object> _files = [];

  DocumentReference<ViolationModel> get _violationDocRef => widget.violationDocRef;
  CollectionReference<ViolationReplyModel> get _replyCollectionRef => widget.replyCollectionRef;

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          final batch = kFirebaseInstant.batch();
          final docRef = _replyCollectionRef.doc();
          _reply.id = docRef.id;
          _reply.createdAt = kNowDate;
          _reply.userId = kUserId;
          _reply.attachments = await _storageService.uploadFiles(MyCollections.tasks, _files);
          batch.set(docRef, _reply);
          batch.update(_violationDocRef, {
            MyFields.status: _reply.status,
            MyFields.lastReply: _reply.toJson(),
          });
          var titleEn = "";
          var titleAr = "";
          var bodyEn = "";
          var bodyAr = "";
          List<UserModel> users = [];
          if (kIsEmployee) {
            users =
                MySharedPreferences.users
                    .where(
                      (e) =>
                          e.role == RoleEnum.admin.value ||
                          e.role == RoleEnum.emtithalManager.value,
                    )
                    .toList();
          } else {
            users.add(UiHelper.getUser(widget.user.id));
          }
          print("_reply.status:: ${_reply.status}");
          if (widget.status == ViolationStatus.pending.value) {
            titleEn = "Violation Reply";
            bodyEn = "The employee has submitted a reply to the violation.";
            titleAr = "تم الرد على المخالفة";
            bodyAr = "قام الموظف بالرد على المخالفة";
          } else if (widget.status == ViolationStatus.confirmed.value) {
            titleEn = "Violation Confirmed";
            bodyEn = "A violation issued by your manager has been confirmed.";
            titleAr = "تم تأكيد المخالفة";
            bodyAr = "تم تأكيد المخالفة التي أصدرها المدير.";
          } else if (widget.status == ViolationStatus.canceled.value) {
            titleEn = "Violation Canceled";
            bodyEn = "The violation issued by your manager has been canceled.";
            titleAr = "تم إلغاء المخالفة";
            bodyAr = "تم إلغاء المخالفة التي أصدرها المدير.";
          }
          for (var user in users) {
            SendNotificationService.sendToUser(
              context,
              userId: user.id!,
              deviceToken: user.deviceToken,
              languageCode: user.languageCode,
              id: _violationDocRef.id,
              type: NotificationType.violation.value,
              titleEn: titleEn,
              titleAr: titleAr,
              bodyEn: bodyEn,
              bodyAr: bodyAr,
            );
          }

          await batch.commit();
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (kIsAdmin) ...[
              Text(
                context.appLocalization.managementDecision,
                style: TextStyle(
                  color: context.colorPalette.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                children:
                    ViolationStatus.values.where((e) => e != ViolationStatus.pending).map((e) {
                      final selected = _reply.status == e.value;
                      return DayBubble(
                        onTap: () {
                          setState(() {
                            _reply.status = e.value;
                          });
                        },
                        title:
                            e == ViolationStatus.confirmed
                                ? context.appLocalization.confirmPenalty
                                : context.appLocalization.cancelPenalty,
                        isSelected: selected,
                        backgroundColor:
                            selected ? context.colorPalette.primary : context.colorPalette.white,
                      );
                    }).toList(),
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TitledTextField(
                title: context.appLocalization.yourMessage,
                child: TextEditor(
                  onChanged: (value) => _reply.comment = value!,
                  maxLines: 4,
                  filled: true,
                  fillColor: context.colorPalette.white,
                ),
              ),
            ),
            ImagesAttacher(
              files: _files,
              onChanged: (files) {
                _files.addAll(files);
              },
            ),
            const SizedBox(height: 30),
            StretchedButton(
              onPressed: () {
                _onSubmit(context);
              },
              child: Text(
                context.appLocalization.send,
                style: TextStyle(
                  color: context.colorPalette.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
