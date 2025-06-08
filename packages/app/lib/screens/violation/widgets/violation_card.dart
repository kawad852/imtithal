import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationCard extends StatelessWidget {
  final ViolationModel violation;
  final String? userId;

  const ViolationCard({super.key, required this.violation, required this.userId});

  @override
  Widget build(BuildContext context) {
    UserModel? user;
    if (!kIsEmployee) {
      final users = context.read<List<UserModel>>();
      user = users.firstWhere(
        (e) => e.id == (userId ?? violation.userId),
        orElse: () => UserModel(),
      );
      violation.userModel ??= user;
    }
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
            VerticalLine(height: 86, color: context.colorPalette.redD62),
            const SizedBox(width: 6),
            if (user?.id != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: UserPhoto(url: user!.profilePhoto, displayName: user.displayName, size: 30),
              ),
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
                    Row(
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
                            user?.displayName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: context.colorPalette.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
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
