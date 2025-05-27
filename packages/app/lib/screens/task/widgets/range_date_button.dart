import 'package:shared/shared.dart';

class RangeDateButton extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  final Function(DateTime start, DateTime end) onChanged;

  const RangeDateButton({
    super.key,
    required this.onChanged,
    required this.startDate,
    required this.endDate,
  });

  Future<DateTimeRange?> _selectDate(BuildContext context) async {
    DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: kFirstDayOfMonthDate,
      lastDate: kNowDate,
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
      saveText: context.appLocalization.save,
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _selectDate(context).then((value) {
          if (value != null) {
            onChanged(value.start, value.end);
          }
        });
      },
      icon: CustomSvg(MyIcons.calendarSearch, color: context.colorPalette.white),
    );
  }
}
