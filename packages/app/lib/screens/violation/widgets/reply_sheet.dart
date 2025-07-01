import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ReplySheet extends StatefulWidget {
  final DocumentReference<ViolationModel> violationDocRef;
  final CollectionReference<ViolationReplyModel> replyCollectionRef;

  const ReplySheet({super.key, required this.violationDocRef, required this.replyCollectionRef});

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
