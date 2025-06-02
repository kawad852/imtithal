import 'package:flutter/cupertino.dart';
import 'package:shared/extensions/base_extension.dart';
import 'package:shared/helper/translation_extension.dart';

enum TaskStatusEnum {
  pending('PENDING'),
  inReview('IN-REVIEW'),
  violated('VIOLATED'),
  completed('COMPLETED');

  final String value;

  const TaskStatusEnum(this.value);

  static String getLabel(String status, BuildContext context) {
    final value = TaskStatusEnum.values.firstWhere((e) => e.value == status);
    if (value == pending) {
      return context.appLocalization.pendingStatus;
    } else if (value == inReview) {
      return context.appLocalization.inReviewStatus;
    } else if (value == completed) {
      return context.appLocalization.completedStatus;
    }
    return '';
  }
}

enum RepeatType {
  once('ONCE'),
  daily('DAILY'),
  weekly('WEEKLY'),
  monthly('MONTHLY');

  final String value;

  const RepeatType(this.value);

  static String getLabel(String type, BuildContext context) {
    final value = RepeatType.values.firstWhere((e) => e.value == type);
    if (value == once) {
      return context.appLocalization.noRepetition;
    } else if (value == daily) {
      return context.appLocalization.daily;
    } else if (value == weekly) {
      return context.appLocalization.weekly;
    } else if (value == monthly) {
      return context.appLocalization.monthly;
    }
    return '';
  }
}

enum TaskDaysEnum {
  sunday('sunday'),
  monday('monday'),
  tuesday('tuesday'),
  wednesday('wednesday'),
  thursday('thursday'),
  friday('friday'),
  saturday('saturday');

  final String value;

  const TaskDaysEnum(this.value);

  static String getLabel(String type, BuildContext context) {
    final value = TaskDaysEnum.values.firstWhere((e) => e.value == type);
    if (value == sunday) {
      return context.appLocalization.sunday;
    } else if (value == monday) {
      return context.appLocalization.monday;
    } else if (value == tuesday) {
      return context.appLocalization.tuesday;
    } else if (value == wednesday) {
      return context.appLocalization.wednesday;
    } else if (value == thursday) {
      return context.appLocalization.thursday;
    } else if (value == friday) {
      return context.appLocalization.friday;
    } else if (value == saturday) {
      return context.appLocalization.saturday;
    }
    return '';
  }
}

enum TaskPoints {
  imtithal(10),
  late(5),
  violated(0);

  final int value;

  const TaskPoints(this.value);

  static (int, String, Color) getPercentage(
    BuildContext context, {
    required int count,
    required double sum,
  }) {
    var label = '';
    var color = context.colorPalette.primary;
    if (count == 0 || sum <= 0) {
      return (0, label, color);
    }
    final evaluationPercentage = (sum / (count * 10)) * 100;
    final percentage = evaluationPercentage.round();
    if (percentage > 95) {
      label = context.appLocalization.excellent;
    } else if (percentage >= 85) {
      label = context.appLocalization.veryGood;
    } else if (percentage >= 50) {
      label = context.appLocalization.good;
      color = context.colorPalette.yellowC39;
    } else {
      color = context.colorPalette.redD62;
      label = context.appLocalization.weak;
    }
    return (percentage, label, color);
  }
}
