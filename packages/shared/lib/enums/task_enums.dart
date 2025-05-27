import 'package:flutter/cupertino.dart';
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

enum ViolationType {
  nonCompliance('NON_COMPLIANCE'),
  rejected('REJECTED'),
  late('LATE'),
  generalSafety('GENERAL-SAFETY');

  final String value;

  const ViolationType(this.value);

  static String getLabel(String status, BuildContext context) {
    final value = ViolationType.values.firstWhere((e) => e.value == status);
    if (value == nonCompliance) {
      return context.appLocalization.nonCompliance;
    } else if (value == rejected) {
      return context.appLocalization.rejected;
    } else if (value == late) {
      return context.appLocalization.late;
    } else if (value == generalSafety) {
      return context.appLocalization.generalSafety;
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

  static int getPercentage({required int count, required double sum}) {
    if (count == 0 || sum <= 0) {
      return 0;
    }
    final evaluationPercentage = (sum / (count * 10)) * 100;
    return evaluationPercentage.round();
  }
}
