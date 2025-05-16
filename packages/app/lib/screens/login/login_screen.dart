import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _username;
  var _password = '';
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      await context.userProvider.login(context, username: _username!, password: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.login,
        onPressed: () {
          _login(context);
        },
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
                    child: UsernameEditor(onChanged: (value) => _username = value),
                  ),
                  const SizedBox(height: 10),
                  TitledTextField(
                    title: context.appLocalization.password,
                    child: PasswordEditor(
                      onChanged: (value) => _password = value!,
                      initialValue: null,
                    ),
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
      ),
    );
  }
}
