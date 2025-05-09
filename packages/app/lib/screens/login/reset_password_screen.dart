import 'package:shared/shared.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        text: "استعادة كلمة المرور",
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: context.mediaQuery.width),
            Text(
              "هل فقدت كلمة المرور ؟ سهلة ",
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "يمكنك استعادتها بخطوات بسيطة",
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "يرجى ادخال بريدك الإلكتروني لإستعادة كلمة المرور.",
                style: TextStyle(
                  color: context.colorPalette.grey8B8,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            EmailEditor(
              initialValue: null,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
