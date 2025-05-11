// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get requiredField => 'حقل مطلوب';

  @override
  String get networkError => 'خطأ في إتصال الإنترنت';

  @override
  String get generalError => 'عذرًا، حدث خطأ ما!';

  @override
  String get authFailed => 'خطأ في عملية التسجيل';
}
