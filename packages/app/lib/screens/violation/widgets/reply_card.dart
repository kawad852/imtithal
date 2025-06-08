import 'package:app/screens/task/widgets/attachments_list.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ReplyCard extends StatelessWidget {
  final ViolationReplyModel reply;

  const ReplyCard({super.key, required this.reply});

  String get _getStatusArabicLabel {
    final status = reply.status;
    if (status == ViolationStatus.confirmed.value) {
      return 'تم تأكيد المخالفة';
    } else if (status == ViolationStatus.canceled.value) {
      return 'تم إلغاء المخالفة';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (reply.userModel == null) {
      final users = context.read<List<UserModel>>();
      final user = users.firstWhere((e) => e.id == reply.userId, orElse: () => UserModel());
      reply.userModel = user;
    }
    final user = reply.userModel!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF5F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 40),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.jobTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.grey8B8,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.displayName,
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
            child: Text(
              reply.comment,
              style: TextStyle(
                color: context.colorPalette.grey8B8,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (reply.status != ViolationStatus.pending.value)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                context.isRTL
                    ? _getStatusArabicLabel
                    : "${context.appLocalization.violation} ${ViolationStatus.getLabel(reply.status, context)}",
                style: TextStyle(
                  color: context.colorPalette.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          if (reply.attachments?.isNotEmpty ?? false) AttachmentsList(files: reply.attachments!),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSvg(MyIcons.clock, color: context.colorPalette.grey8B8, width: 16),
              const SizedBox(width: 10),
              Text(
                reply.createdAt!.getTime(context),
                style: TextStyle(
                  color: context.colorPalette.grey8B8,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 10),
              CustomSvg(MyIcons.calendar, color: context.colorPalette.grey8B8, width: 16),
              const SizedBox(width: 10),
              Text(
                reply.createdAt!.getDefaultFormattedDate(context),
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
    );
  }
}
