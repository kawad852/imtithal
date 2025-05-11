import 'package:shared/shared.dart';

class LeaveInputScreen extends StatefulWidget {
  const LeaveInputScreen({super.key});

  @override
  State<LeaveInputScreen> createState() => _LeaveInputScreenState();
}

class _LeaveInputScreenState extends State<LeaveInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        onPressed: () {},
        text: context.appLocalization.addNewLeave,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.appLocalization.addNewLeave,
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                context.appLocalization.leaveNote,
                style: TextStyle(
                  color: context.colorPalette.grey8B8,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TitledTextField(
              title: context.appLocalization.leaveTitle,
              child: TextEditor(
                onChanged: (value) {},
                hintText: context.appLocalization.taskTitleToComplyWith,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TitledTextField(
                title: context.appLocalization.leaveDescription,
                child: TextEditor(
                  onChanged: (value) {},
                  hintText: context.appLocalization.requiredTaskDescription,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TitledTextField(
                    title: context.appLocalization.fromDate,
                    child: TextEditor(onChanged: (value) {}),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TitledTextField(
                    title: context.appLocalization.toDate,
                    child: TextEditor(onChanged: (value) {}),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
