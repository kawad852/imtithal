import 'package:app/screens/calender/widgets/calendar_date_text.dart';
import 'package:app/screens/calender/widgets/calendar_icon_button.dart';
import 'package:shared/shared.dart';

import '../search/search_screen.dart';
import '../task/widgets/task_card.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = kNowDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.appLocalization.calendar,
          style: TextStyle(
            color: context.colorPalette.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          SearchScreen(
            hintText: context.appLocalization.searchTask,
            includeIndexes: (false, false, true),
            filters: kIsEmployee ? '${MyFields.assignedUserIds}:$kUserId' : null,
            builder: (controller) {
              return IconButton(
                onPressed: () {
                  controller.openView();
                },
                icon: const CustomSvg(MyIcons.search),
              );
            },
          ),

          CalendarIconButton(
            value: _selectedDate,
            minDateTime: kNowDate,
            onChanged: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: context.mediaQuery.width),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CalendarDateText(date: _selectedDate),
          ),
          MonthCalender(
            date: _selectedDate,
            onChanged: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
          ),
          Expanded(
            child: CustomFirestoreQueryBuilder(
              key: ValueKey(_selectedDate),
              // query: context.taskProvider.getAssignedTasksFromDate(context, _selectedDate),
              query: TasksService.fetchTasksList(context, date: _selectedDate),
              onComplete: (context, snapshot) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: snapshot.docs.length,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemBuilder: (context, index) {
                    if (snapshot.isLoadingMore(index)) {
                      return const FPLoading();
                    }
                    final task = snapshot.docs[index].data();
                    return TaskCard(task: task);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
