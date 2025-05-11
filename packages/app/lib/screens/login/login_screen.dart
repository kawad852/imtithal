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
      bottomNavigationBar: BottomButton(text: context.appLocalization.login, onPressed: () {}),
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
                  context.appLocalization.simply,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  context.appLocalization.imtithal,
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  context.appLocalization.limitless,
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
                  title: context.appLocalization.usernameEmail,
                  child: TextEditor(
                    onChanged: (value) {},
                    prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.user)),
                  ),
                ),
                const SizedBox(height: 10),
                TitledTextField(
                  title: context.appLocalization.password,
                  child: PasswordEditor(onChanged: (value) {}, initialValue: null),
                ),
                Row(
                  children: [
                    Text(
                      context.appLocalization.forgotPassword,
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
                        context.appLocalization.resetPassword,
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
