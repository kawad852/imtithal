import 'package:shared/shared.dart';

import '../task/widgets/task_card.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text(
          context.appLocalization.calendar,
          style: TextStyle(
            color: context.colorPalette.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const CustomSvg(MyIcons.search)),
          IconButton(onPressed: () {}, icon: const CustomSvg(MyIcons.calendarSearch)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: context.mediaQuery.width),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "مايو / 2025",
              style: TextStyle(
                color: context.colorPalette.grey8B8,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const MonthCalender(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemBuilder: (context, index) {
                return TaskCard(task: TaskModel(repeatDays: [], attachments: [], companyId: ''));
              },
            ),
          ),
        ],
      ),
    );
  }
}
