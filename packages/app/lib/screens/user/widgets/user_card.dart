import 'package:app/screens/user/widgets/user_card_display.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigate((context) => UserScreen(user: user));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            Expanded(child: UserCardDisplay(user: user)),
            Icon(Icons.arrow_forward_ios_rounded, color: context.colorPalette.grey8B8),
          ],
        ),
      ),
    );
  }
}
