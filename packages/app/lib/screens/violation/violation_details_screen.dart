import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationDetailsScreen extends StatefulWidget {
  final ViolationModel? violation;
  final String? id;
  final String? userId;

  const ViolationDetailsScreen({super.key, required this.violation, this.id, this.userId});

  @override
  State<ViolationDetailsScreen> createState() => _ViolationDetailsScreenState();
}

class _ViolationDetailsScreenState extends State<ViolationDetailsScreen> {
  late Stream<List<dynamic>> _streams;

  String get _id => widget.violation?.id ?? widget.id!;
  String get _userId => widget.violation?.user.id ?? widget.userId!;

  DocumentReference<ViolationModel> get _violationDocRef =>
      kFirebaseInstant.userViolations(_userId).doc(_id);
  CollectionReference<ViolationReplyModel> get _replyCollectionRef => _violationDocRef
      .collection(MyCollections.replies)
      .withConverter<ViolationReplyModel>(
        fromFirestore: (snapshot, _) => ViolationReplyModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  void _initialize() {
    final violationStream = _violationDocRef.snapshots().map((e) => e.data()!);

    final repliesStream = _replyCollectionRef.orderByCreatedAtDesc.snapshots();

    _streams = Rx.combineLatest2<ViolationModel, QuerySnapshot<ViolationReplyModel>, List<dynamic>>(
      violationStream,
      repliesStream,
      (s1, s2) {
        return [s1, s2];
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _streams,
      onComplete: (context, snapshot) {
        final violation = snapshot.data![0] as ViolationModel;
        final replies = snapshot.data![1] as QuerySnapshot<ViolationReplyModel>;

        violation.userModel ??= UiHelper.getUser(violation.user.id);

        return Scaffold(
          appBar: AppBar(),
          bottomNavigationBar:
              violation.status == ViolationStatus.pending.value && !kIsDepartmentManager
                  ? BottomButton(
                    onPressed: () {
                      context.showBottomSheet(
                        context,
                        builder: (context) {
                          return ReplySheet(
                            violationDocRef: _violationDocRef,
                            replyCollectionRef: _replyCollectionRef,
                            user: violation.user,
                            status: violation.status,
                          );
                        },
                      );
                    },
                    text: context.appLocalization.addReply,
                  )
                  : null,
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
                  violation.description,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ViolationInfo(violation: violation),

              if (violation.lastReply != null)
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
                                CustomSvg(
                                  MyIcons.clock,
                                  color: context.colorPalette.grey8B8,
                                  width: 16,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  violation.lastReply!.createdAt!.getTime(context),
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
                                  violation.lastReply!.createdAt!.getDefaultFormattedDate(context),
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
                        title: ViolationStatus.getLabel(violation.status, context),
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
                        title: ViolationType.getLabel(violation.type, context),
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
                      violation.userModel!.displayName,
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
                  violation.notes,
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
                  violation.description,
                  style: TextStyle(
                    color: context.colorPalette.grey8B8,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              if (violation.attachments?.isNotEmpty ?? false) ...[
                Text(
                  "${context.appLocalization.attachedFiles} (${violation.attachments!.length})",
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ImagesAttacher(onChanged: null, files: violation.attachments!),
              ],
              Divider(color: context.colorPalette.grey8B8),
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: replies.docs.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  final reply = replies.docs[index].data();
                  return ReplyCard(reply: reply);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
