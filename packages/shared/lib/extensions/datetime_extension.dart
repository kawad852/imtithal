import 'package:shared/shared.dart';

import '../../object_box_exports.dart';

extension DatetimeExtension on DateTime {
  String getTime(BuildContext context) => DateFormat.jm(context.languageCode).format(this);
  String getDefaultFormattedDate(BuildContext context) =>
      DateFormat.yMd(context.languageCode).format(this);
  String getDefaultFormattedDateWithTune(BuildContext context) =>
      DateFormat.yMd(context.languageCode).add_jm().format(this);
}

extension DayTimeExtension on String {
  TimeOfDay get convertStringToTimeOfDay {
    final arabicPM = contains('م');
    // final arabicAM = contains('ص');
    final isPm = contains('PM') || arabicPM;
    final parts = split(':');
    final hour = int.parse(parts[0].trim());
    final minute = int.parse(parts[1].replaceAll(RegExp(r'[^0-9]'), '').trim());

    int adjustedHour;
    if (hour == 12) {
      adjustedHour = isPm ? 12 : 0;
    } else {
      adjustedHour = isPm ? hour + 12 : hour;
    }

    return TimeOfDay(hour: adjustedHour, minute: minute);
  }
}
