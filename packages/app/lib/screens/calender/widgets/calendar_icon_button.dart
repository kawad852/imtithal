import 'package:flutter/material.dart';
import 'package:shared/network/api_service.dart';
import 'package:shared/utils/my_icons.dart';
import 'package:shared/widgets/custom_svg.dart';
import 'package:shared/widgets/editors/date_picker_editor.dart';

class CalendarIconButton extends StatelessWidget {
  final DateTime value;
  final DateTime? minDateTime;
  final Function(DateTime value) onChanged;

  const CalendarIconButton({
    super.key,
    required this.value,
    this.minDateTime,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DatePickerEditor(
      value: value,
      minDateTime: minDateTime ?? kNowDate,
      onChanged: onChanged,
      builder: (context, onTap) {
        return IconButton(onPressed: onTap, icon: const CustomSvg(MyIcons.calendarSearch));
      },
    );
  }
}
