import 'package:app/screens/user/user_input_screen.dart';
import 'package:shared/shared.dart';

class UserInformation extends StatelessWidget {
  final bool edit;
  final (int, String, Color) percentageValues;

  const UserInformation({super.key, this.edit = false, required this.percentageValues});

  @override
  Widget build(BuildContext context) {
    return UserSelector(
      builder: (context, user) {
        return Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 70),
                if (edit)
                  GestureDetector(
                    onTap: () {
                      context.navigate((context) {
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
                      "${user.jobTitle.isEmpty ? context.appLocalization.admin : user.jobTitle} - ${MySharedPreferences.company?.name}",
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
                      "${context.appLocalization.employeeNo}: ${user.rowId}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.grey666,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  else
                    Text(
                      "${percentageValues.$1}% ، ${context.appLocalization.facilityCompliance} ${percentageValues.$2}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: percentageValues.$3,
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
