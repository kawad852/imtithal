import '../shared.dart';

enum ViolationStatus {
  pending(defaultValue),
  confirmed('CONFIRMED'),
  canceled('CANCELED');

  static const String defaultValue = 'PENDING';
  final String value;

  const ViolationStatus(this.value);

  static String getLabel(String status, BuildContext context) {
    final value = ViolationStatus.values.firstWhere((e) => e.value == status);
    if (value == confirmed) {
      return context.appLocalization.confirmed;
    } else if (value == canceled) {
      return context.appLocalization.canceled;
    } else if (value == pending) {
      return context.appLocalization.pending;
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
