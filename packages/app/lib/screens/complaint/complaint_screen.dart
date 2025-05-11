import 'package:shared/shared.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        onPressed: () {},
        text: context.appLocalization.send,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.appLocalization.sendComplaintOrReport,
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.appLocalization.doYouHaveComplaintReport,
              style: TextStyle(
                color: context.colorPalette.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              context.appLocalization.complaintNote,
              style: TextStyle(
                color: context.colorPalette.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: TitledTextField(
                title: context.appLocalization.yourMessage,
                textStyle: TextStyle(
                  color: context.colorPalette.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                child: TextEditor(onChanged: (value) {}, maxLines: 5),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const CustomSvg(MyIcons.attachSquare),
                  const SizedBox(width: 15),
                  Text(
                    context.appLocalization.attachFilesImages,
                    style: TextStyle(
                      color: context.colorPalette.black252,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
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
