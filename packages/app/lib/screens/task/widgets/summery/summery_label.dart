import 'package:flutter/material.dart';
import 'package:shared/extensions/base_extension.dart';
import 'package:shared/extensions/datetime_extension.dart';
import 'package:shared/helper/translation_extension.dart';
import 'package:shared/utils/app_constants.dart';

class SummeryLabel extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final (int, String, Color) values;

  const SummeryLabel({
    super.key,
    required this.startDate,
    required this.values,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final formattedStart = startDate.getDefaultFormattedDate(context);
    final formattedEnd = endDate.getDefaultFormattedDate(context);
    final isThisMonth =
        startDate.year == kFirstDayOfMonthDate.year &&
        startDate.month == kFirstDayOfMonthDate.month &&
        startDate.day == kFirstDayOfMonthDate.day &&
        endDate.year == kTodayDate.year &&
        endDate.month == kTodayDate.month &&
        endDate.day == kTodayDate.day;
    return ListBody(
      children: [
        Text(
          isThisMonth
              ? "${context.appLocalization.thisMonthComplianceAssessment} , ${context.appLocalization.since}  $formattedStart ${context.appLocalization.toDay}"
              : "${context.appLocalization.sinceComplianceAssessment} $formattedStart - $formattedEnd",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: context.colorPalette.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: values.$3, shape: BoxShape.circle),
                child: Text(
                  "${values.$1}%",
                  style: TextStyle(
                    color: context.colorPalette.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.appLocalization.complianceAssessment,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${context.appLocalization.imtithal} ${values.$2}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: values.$3, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
