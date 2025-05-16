import 'dart:math' as math;

import 'package:shared/shared.dart';

import '../../object_box_exports.dart';

extension DatetimeExtension on DateTime {
  String getTime(BuildContext context) => DateFormat.jm(context.languageCode).format(this);
  String getDefaultFormattedDate(BuildContext context) =>
      DateFormat.yMd(context.languageCode).format(this);
}

extension DayTimeExtension on String {
  TimeOfDay get convertStringToTimeOfDay {
    final parts = split(':');
    final hour = int.parse(parts[0].trim());
    final minute = int.parse(parts[1].trim().split(' ')[0]);

    final isPm = parts[1].trim().endsWith('PM');
    final adjustedHour = isPm ? hour + 12 : math.min(hour, 12);

    return TimeOfDay(hour: adjustedHour, minute: minute);
  }
}
