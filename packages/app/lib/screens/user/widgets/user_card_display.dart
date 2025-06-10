import 'package:shared/shared.dart';

class UserCardDisplay extends StatelessWidget {
  final UserModel user;

  const UserCardDisplay({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 60),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  user.displayName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
