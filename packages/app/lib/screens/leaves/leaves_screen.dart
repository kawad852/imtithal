import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      bottomNavigationBar: BottomButton(
        onPressed: () {
          context.navigate((context) => const LeaveInputScreen());
        },
        text: context.appLocalization.addNewLeave,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.appLocalization.leavesAndHolidays,
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
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 11),
                itemCount: 20,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return const LeaveCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
