import 'package:shared/shared.dart';

import '../object_box_exports.dart';

class MonthCalender extends StatefulWidget {
  final DateTime date;
  final Function(DateTime date) onChanged;

  const MonthCalender({super.key, required this.date, required this.onChanged});

  @override
  State<MonthCalender> createState() => _MonthCalenderState();
}

class _MonthCalenderState extends State<MonthCalender> {
  late DateTime _selectedDate;

  List<DateTime> get _days {
    final firstDay = DateTime(widget.date.year, widget.date.month, 1);
    final lastDay = DateTime(widget.date.year, widget.date.month + 1, 0); // last day of month

    List<DateTime> days = [];
    for (int i = 0; i < lastDay.day; i++) {
      days.add(DateTime(widget.date.year, widget.date.month, i + 1));
    }

    return days;
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemCount: _days.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemBuilder: (context, index) {
          final date = _days[index];
          final selected = _selectedDate.day == date.day;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
              widget.onChanged(_selectedDate);
            },
            child: Container(
              width: 55,
              height: 70,
              decoration: BoxDecoration(
                color: selected ? context.colorPalette.primary : context.colorPalette.greyF5F,
                borderRadius: BorderRadius.circular(kRadiusPrimary),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEEE', context.languageCode).format(date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected ? context.colorPalette.white : context.colorPalette.black252,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    date.day.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected ? context.colorPalette.white : context.colorPalette.black252,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
