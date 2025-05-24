import 'package:intl/intl.dart' as intl;
import 'package:shared/shared.dart';

import '../task/widgets/task_card.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late DateTime _selectedDate;

  Query<TaskModel> get _getQuery {
    late Query<TaskModel> query;
    final startDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
    final endDate = startDate.add(const Duration(days: 1));
    final filter = Filter.and(
      Filter(MyFields.deliveryDate, isGreaterThanOrEqualTo: Timestamp.fromDate(startDate)),
      Filter(MyFields.deliveryDate, isLessThan: Timestamp.fromDate(endDate)),
      Filter(MyFields.companyId, isEqualTo: kCompanyId),
    );
    if (kIsEmployee) {
      return kFirebaseInstant.assignedTasks.where(filter);
    } else {
      query = kFirebaseInstant.tasks.where(filter);
    }
    return query.orderByDeliveryDateDesc;
  }

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
          IconButton(onPressed: () {}, icon: const CustomSvg(MyIcons.search)),
          DatePickerEditor(
            value: _selectedDate,
            minDateTime: kNowDate,
            onChanged: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
            builder: (context, onTap) {
              return IconButton(onPressed: onTap, icon: const CustomSvg(MyIcons.calendarSearch));
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
            child: Text(
              intl.DateFormat.yMMM(context.languageCode).format(_selectedDate),
              style: TextStyle(
                color: context.colorPalette.grey8B8,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
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
              query: _getQuery,
              onComplete: (context, snapshot) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: snapshot.docs.length,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemBuilder: (context, index) {
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
