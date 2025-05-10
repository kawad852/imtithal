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
        title: Text(
          "الحساب الشخصي",
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
          const UserCard(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "النظام",
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
            title: "تغيير اللغة",
          ),
          ProfileCard(
            onTap: () {},
            icon: MyIcons.judge,
            title: "القوانين والأنظمة",
          ),
          ProfileCard(
            onTap: () {},
            icon: MyIcons.policy,
            title: "سياسة الخصوصية",
          ),
          ProfileCard(
            onTap: () {},
            icon: MyIcons.smsTracking,
            title: "ارسال شكوى او بلاغ للإدارة",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "الحساب",
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
            title: "تغيير كلمة المرور",
          ),
          ProfileCard(
            onTap: () {},
            icon: MyIcons.logout,
            backgroundColor: context.colorPalette.redD623,
            title: "تسجيل الخروج",
          ),
        ],
      ),
    );
  }
}
