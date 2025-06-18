import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shared/extensions/base_extension.dart';
import 'package:shared/extensions/datetime_extension.dart';
import 'package:shared/helper/translation_extension.dart';

class CalendarDateText extends StatelessWidget {
  final DateTime date;
  final bool fullDate;

  const CalendarDateText({super.key, required this.date, this.fullDate = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      fullDate
          ? date.getDefaultFormattedDate(context)
          : intl.DateFormat.yMMM(context.languageCode).format(date),
      style: TextStyle(
        color: context.colorPalette.grey8B8,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
