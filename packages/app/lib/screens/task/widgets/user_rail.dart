import 'package:shared/shared.dart';

class UserRail extends StatelessWidget {
  final LightUserModel lightUser;
  final Color color;

  const UserRail({super.key, required this.lightUser, required this.color});

  @override
  Widget build(BuildContext context) {
    final user = UiHelper.getUser(lightUser.id);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        VerticalLine(height: 86, color: color),
        const SizedBox(width: 6),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 60),
        ),
      ],
    );
  }
}
