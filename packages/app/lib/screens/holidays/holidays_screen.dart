import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class HolidaysScreen extends StatefulWidget {
  const HolidaysScreen({super.key});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      bottomNavigationBar: BottomButton(
        onPressed: () {},
        text: "اضافة اجازة جديدة",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "العطلات والإجازات",
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "يمكنك ادخال ايام اجازة او عطلات لإعفاء الموظفين جميعاً من مهام الإمتثال خلال ايام الإجازة",
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
                  return const HolidayCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
