import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Text(
          context.appLocalization.personalAccount,
          style: TextStyle(
            color: context.colorPalette.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        children: [
          // const UserBubble(),
          const UserInformation(edit: true, percentageValues: (0, '', Colors.white)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              context.appLocalization.system,
              style: TextStyle(
                color: context.colorPalette.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ProfileCard(
            onTap: () {},
            icon: MyIcons.translate,
            title: context.appLocalization.changeLanguage,
          ),
          ProfileCard(
            onTap: () {
              context.navigate((context) => const PolicyScreen(policyEnum: PolicyEnum.laws));
            },
            icon: MyIcons.judge,
            title: context.appLocalization.lawsAndRegulations,
          ),
          ProfileCard(
            onTap: () {
              context.navigate((context) => const PolicyScreen(policyEnum: PolicyEnum.policy));
            },
            icon: MyIcons.policy,
            title: context.appLocalization.privacyPolicy,
          ),
          ProfileCard(
            onTap: () {
              context.navigate((context) => const ComplaintScreen());
            },
            icon: MyIcons.smsTracking,
            title: context.appLocalization.sendComplaintOrReport,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              context.appLocalization.account,
              style: TextStyle(
                color: context.colorPalette.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ProfileCard(
            onTap: () {},
            icon: MyIcons.lock,
            title: context.appLocalization.changePassword,
          ),
          ProfileCard(
            onTap: () {
              context.userProvider.logout(context);
            },
            icon: MyIcons.logout,
            backgroundColor: context.colorPalette.redD623,
            title: context.appLocalization.logOut,
          ),
        ],
      ),
    );
  }
}
