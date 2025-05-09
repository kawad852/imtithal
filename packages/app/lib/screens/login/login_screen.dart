import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(text: "تسجيل الدخول", onPressed: () {}),
      body: Column(
        children: [
          SizedBox(width: context.mediaQuery.width, height: 100),
          const CustomSvg(MyIcons.logo),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ببساطـــــــــــة، ",
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "امتثال",
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  " بلا حدود",
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                TitledTextField(
                  title: "اسم المستخدم / البريد الألكتروني",
                  child: TextEditor(
                    onChanged: (value) {},
                    prefixIcon: const IconButton(
                      onPressed: null,
                      icon: CustomSvg(MyIcons.user),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TitledTextField(
                  title: "كلمة المرور",
                  child: PasswordEditor(
                    onChanged: (value) {},
                    initialValue: null,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "هل نسيت كلمة المرور ؟",
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push((context) => const ResetPasswordScreen());
                      },
                      child: Text(
                        "استعادة كلمة المرور",
                        style: TextStyle(
                          color: context.colorPalette.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
