import 'package:app/screens/user/user_input_screen.dart';
import 'package:shared/shared.dart';

class UserInformation extends StatelessWidget {
  final bool edit;

  const UserInformation({super.key, this.edit = false});

  @override
  Widget build(BuildContext context) {
    return UserSelector(
      builder: (context, user) {
        return Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 35),
                if (edit)
                  GestureDetector(
                    onTap: () {
                      context.push((context) {
                        return UserInputScreen(user: user);
                      });
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.colorPalette.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const CustomSvg(MyIcons.edit),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (!edit)
                        Text(
                          "${context.appLocalization.hello} ، ",
                          style: TextStyle(
                            color: context.colorPalette.black252,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          user.displayName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "${user.jobTitle} - شركة نستطيع",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.grey8B8,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (user.role == RoleEnum.employee.value)
                    Text(
                      "${context.appLocalization.employeeNo}: ${user.id}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.grey666,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  else
                    Text(
                      "%94 ، ${context.appLocalization.facilityCompliance} ممتاز",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
