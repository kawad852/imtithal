import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class HolidaysScreen extends StatefulWidget {
  const HolidaysScreen({super.key});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  late Query<HolidayModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.companyHolidays.orderByCreatedAtDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      bottomNavigationBar: BottomButton(
        onPressed: () {
          context.navigate((context) => const HolidayInputScreen());
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
              child: CustomFirestoreQueryBuilder(
                query: _query,
                onComplete: (context, snapshot) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 11),
                    itemCount: snapshot.docs.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      if (snapshot.isLoadingMore(index)) {
                        return const FPLoading();
                      }
                      final holiday = snapshot.docs[index].data();
                      return HolidayCard(holiday: holiday);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
