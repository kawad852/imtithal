import 'package:app/screens/task/widgets/user_rail.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationCard extends StatelessWidget {
  final ViolationModel violation;
  final String? userId;

  const ViolationCard({super.key, required this.violation, required this.userId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigate((context) => ViolationDetailsScreen(violation: violation));
      },
      child: Container(
        width: double.infinity,
        height: 102,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            UserRail(lightUser: violation.user, color: context.colorPalette.redC10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${ViolationType.getLabel(violation.type, context)} #${violation.id}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.grey8B8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        height: 22,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.colorPalette.primary,
                          borderRadius: BorderRadius.circular(kRadiusPrimary),
                        ),
                        child: Text(
                          ViolationStatus.getLabel(violation.status, context),
                          style: TextStyle(
                            color: context.colorPalette.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      violation.description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  if (violation.lastReply != null)
                    Builder(
                      builder: (context) {
                        final lastReplyUser = UiHelper.getUser(violation.lastReply!.userId);
                        return Row(
                          children: [
                            Text(
                              "${context.appLocalization.lastResponseBy} : ",
                              style: TextStyle(
                                color: context.colorPalette.grey8B8,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                lastReplyUser.displayName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: context.colorPalette.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  const SizedBox(height: 4),
                  Text(
                    violation.createdAt!.getDefaultFormattedDateWithTune(context),
                    style: TextStyle(
                      color: context.colorPalette.grey8B8,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
