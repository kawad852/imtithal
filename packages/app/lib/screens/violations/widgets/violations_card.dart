import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationsCard extends StatelessWidget {
  final ViolationModel violation;
  final String? userId;

  const ViolationsCard({super.key, required this.violation, required this.userId});

  @override
  Widget build(BuildContext context) {
    UserModel? user;
    if (userId != null) {
      final users = context.read<List<UserModel>>();
      user = users.firstWhere((e) => e.id == userId, orElse: () => UserModel());
    }
    return GestureDetector(
      onTap: () {
        context.push((context) => const ViolationSingleScreen());
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
            if (user?.id != null)
              UserPhoto(url: user!.profilePhoto, displayName: user.displayName, size: 60),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "عدم امتثال 13324#",
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
                          "تم الإلغاء",
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
                      "ارشفة برنامج زهو",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
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
                          "محمد عبدالله",
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
                    "08:30 صباحاً- 01.05.2025",
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
