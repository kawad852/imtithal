import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'lib/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @requiredField.
  ///
  /// In ar, this message translates to:
  /// **'حقل مطلوب'**
  String get requiredField;

  /// No description provided for @networkError.
  ///
  /// In ar, this message translates to:
  /// **'خطأ في إتصال الإنترنت'**
  String get networkError;

  /// No description provided for @generalError.
  ///
  /// In ar, this message translates to:
  /// **'عذرًا، حدث خطأ ما!'**
  String get generalError;

  /// No description provided for @authFailed.
  ///
  /// In ar, this message translates to:
  /// **'خطأ في عملية التسجيل'**
  String get authFailed;

  /// No description provided for @simply.
  ///
  /// In ar, this message translates to:
  /// **'ببساطـــــــــــة، '**
  String get simply;

  /// No description provided for @limitless.
  ///
  /// In ar, this message translates to:
  /// **'بلا حدود'**
  String get limitless;

  /// No description provided for @usernameEmail.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم / البريد الألكتروني'**
  String get usernameEmail;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In ar, this message translates to:
  /// **'هل نسيت كلمة المرور ؟'**
  String get forgotPassword;

  /// No description provided for @resetPassword.
  ///
  /// In ar, this message translates to:
  /// **'استعادة كلمة المرور'**
  String get resetPassword;

  /// No description provided for @imtithal.
  ///
  /// In ar, this message translates to:
  /// **'امتثال'**
  String get imtithal;

  /// No description provided for @invalidEmail.
  ///
  /// In ar, this message translates to:
  /// **'بريد إلكتروني غير صالح'**
  String get invalidEmail;

  /// No description provided for @invalidNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم غير صالح'**
  String get invalidNumber;

  /// No description provided for @passwordTooShort.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن يكون على الأقل 6 أحرف'**
  String get passwordTooShort;

  /// No description provided for @passwordNotMatch.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور غير متطابقة'**
  String get passwordNotMatch;

  /// No description provided for @lostYourPassword.
  ///
  /// In ar, this message translates to:
  /// **'هل فقدت كلمة المرور ؟ سهلة'**
  String get lostYourPassword;

  /// No description provided for @youCanRecoverIt.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك استعادتها بخطوات بسيطة'**
  String get youCanRecoverIt;

  /// No description provided for @enterEmailToRecoverPass.
  ///
  /// In ar, this message translates to:
  /// **'يرجى ادخال بريدك الإلكتروني لإستعادة كلمة المرور.'**
  String get enterEmailToRecoverPass;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الصفحة الرئيسية'**
  String get home;

  /// No description provided for @hello.
  ///
  /// In ar, this message translates to:
  /// **'السلام عليكم'**
  String get hello;

  /// No description provided for @facilityCompliance.
  ///
  /// In ar, this message translates to:
  /// **'إمتثال المنشأة'**
  String get facilityCompliance;

  /// No description provided for @todayImtithalSummary.
  ///
  /// In ar, this message translates to:
  /// **'ملخص إمتثال اليوم'**
  String get todayImtithalSummary;

  /// No description provided for @more.
  ///
  /// In ar, this message translates to:
  /// **'المزيد'**
  String get more;

  /// No description provided for @incomplete.
  ///
  /// In ar, this message translates to:
  /// **'غير مكتملة'**
  String get incomplete;

  /// No description provided for @complete.
  ///
  /// In ar, this message translates to:
  /// **'مكتملة'**
  String get complete;

  /// No description provided for @late.
  ///
  /// In ar, this message translates to:
  /// **'متأخرة'**
  String get late;

  /// No description provided for @nonCompliant.
  ///
  /// In ar, this message translates to:
  /// **'مخالفة'**
  String get nonCompliant;

  /// No description provided for @searchTaskEmployee.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن مهمة ، موظف'**
  String get searchTaskEmployee;

  /// No description provided for @topTasks.
  ///
  /// In ar, this message translates to:
  /// **'ابرز المهام'**
  String get topTasks;

  /// No description provided for @dailyTask.
  ///
  /// In ar, this message translates to:
  /// **'مهمة يومية'**
  String get dailyTask;

  /// No description provided for @calendar.
  ///
  /// In ar, this message translates to:
  /// **'التقويم'**
  String get calendar;

  /// No description provided for @addNewTask.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مهمة جديدة'**
  String get addNewTask;

  /// No description provided for @monitorViolation.
  ///
  /// In ar, this message translates to:
  /// **'رصد مخالفة'**
  String get monitorViolation;

  /// No description provided for @facilityManagement.
  ///
  /// In ar, this message translates to:
  /// **'إدارة المنشأة'**
  String get facilityManagement;

  /// No description provided for @addNewEmployee.
  ///
  /// In ar, this message translates to:
  /// **'اضافة موظف جديد'**
  String get addNewEmployee;

  /// No description provided for @addNewCompliance.
  ///
  /// In ar, this message translates to:
  /// **'اضافة امتثال جديد'**
  String get addNewCompliance;

  /// No description provided for @addNewDepartment.
  ///
  /// In ar, this message translates to:
  /// **'اضافة قسم جديد'**
  String get addNewDepartment;

  /// No description provided for @sendNewNotification.
  ///
  /// In ar, this message translates to:
  /// **'ارسال اشعار جديد'**
  String get sendNewNotification;

  /// No description provided for @leavesAndHolidays.
  ///
  /// In ar, this message translates to:
  /// **'الإجازات والعطلات'**
  String get leavesAndHolidays;

  /// No description provided for @lawsAndRegulations.
  ///
  /// In ar, this message translates to:
  /// **'القوانين والأنظمة'**
  String get lawsAndRegulations;

  /// No description provided for @violations.
  ///
  /// In ar, this message translates to:
  /// **'المخالفات'**
  String get violations;

  /// No description provided for @reports.
  ///
  /// In ar, this message translates to:
  /// **'التقارير'**
  String get reports;

  /// No description provided for @searchDepartmentEmployee.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن قسم ، موظف'**
  String get searchDepartmentEmployee;

  /// No description provided for @facilityDepartments.
  ///
  /// In ar, this message translates to:
  /// **'اقسام المنشأة'**
  String get facilityDepartments;

  /// No description provided for @employee.
  ///
  /// In ar, this message translates to:
  /// **'موظف'**
  String get employee;

  /// No description provided for @responsibleManager.
  ///
  /// In ar, this message translates to:
  /// **'المدير المسؤول'**
  String get responsibleManager;

  /// No description provided for @personalAccount.
  ///
  /// In ar, this message translates to:
  /// **'الحساب الشخصي'**
  String get personalAccount;

  /// No description provided for @system.
  ///
  /// In ar, this message translates to:
  /// **'النظام'**
  String get system;

  /// No description provided for @changeLanguage.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get changeLanguage;

  /// No description provided for @privacyPolicy.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الخصوصية'**
  String get privacyPolicy;

  /// No description provided for @sendComplaintOrReport.
  ///
  /// In ar, this message translates to:
  /// **'ارسال شكوى او بلاغ للإدارة'**
  String get sendComplaintOrReport;

  /// No description provided for @account.
  ///
  /// In ar, this message translates to:
  /// **'الحساب'**
  String get account;

  /// No description provided for @changePassword.
  ///
  /// In ar, this message translates to:
  /// **'تغيير كلمة المرور'**
  String get changePassword;

  /// No description provided for @logOut.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logOut;

  /// No description provided for @send.
  ///
  /// In ar, this message translates to:
  /// **'ارسال'**
  String get send;

  /// No description provided for @notifications.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// No description provided for @addNewLeave.
  ///
  /// In ar, this message translates to:
  /// **'اضافة اجازة جديدة'**
  String get addNewLeave;

  /// No description provided for @leaveNote.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك ادخال ايام اجازة او عطلات لإعفاء الموظفين جميعاً من مهام الإمتثال خلال ايام الإجازة'**
  String get leaveNote;

  /// No description provided for @leaveNo.
  ///
  /// In ar, this message translates to:
  /// **'اجازة رقم'**
  String get leaveNo;

  /// No description provided for @leaveSetFromDate.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديد الإجازة من تاريخ'**
  String get leaveSetFromDate;

  /// No description provided for @toDate.
  ///
  /// In ar, this message translates to:
  /// **'إلى تاريخ'**
  String get toDate;

  /// No description provided for @monitoredViolations.
  ///
  /// In ar, this message translates to:
  /// **'مخالفات مرصودة'**
  String get monitoredViolations;

  /// No description provided for @searchViolationEmployee.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن مخالفة ، باسم الموظف'**
  String get searchViolationEmployee;

  /// No description provided for @lastResponseBy.
  ///
  /// In ar, this message translates to:
  /// **'اخر رد من خلال'**
  String get lastResponseBy;

  /// No description provided for @leaveTitle.
  ///
  /// In ar, this message translates to:
  /// **'عنوان الإجازة'**
  String get leaveTitle;

  /// No description provided for @taskTitleToComplyWith.
  ///
  /// In ar, this message translates to:
  /// **'عنوان المهمة المطلوب الإمتثال لها'**
  String get taskTitleToComplyWith;

  /// No description provided for @leaveDescription.
  ///
  /// In ar, this message translates to:
  /// **'وصف الإجازة'**
  String get leaveDescription;

  /// No description provided for @requiredTaskDescription.
  ///
  /// In ar, this message translates to:
  /// **'وصف المهمة المطلوبة'**
  String get requiredTaskDescription;

  /// No description provided for @fromDate.
  ///
  /// In ar, this message translates to:
  /// **'من تاريخ'**
  String get fromDate;

  /// No description provided for @doYouHaveComplaintReport.
  ///
  /// In ar, this message translates to:
  /// **'هل لديك شكوى او بلاغ ؟'**
  String get doYouHaveComplaintReport;

  /// No description provided for @complaintNote.
  ///
  /// In ar, this message translates to:
  /// **'ارسله للإدارة بكل خصوصية وسرية وسيتم العمل عليه لأجل المصلحة العامة للمنشأة بجدية'**
  String get complaintNote;

  /// No description provided for @yourMessage.
  ///
  /// In ar, this message translates to:
  /// **'رسالتك'**
  String get yourMessage;

  /// No description provided for @attachFilesImages.
  ///
  /// In ar, this message translates to:
  /// **'إرفاق ملفات ، صور'**
  String get attachFilesImages;

  /// No description provided for @department.
  ///
  /// In ar, this message translates to:
  /// **'قسم'**
  String get department;

  /// No description provided for @thisMonthComplianceAssessment.
  ///
  /// In ar, this message translates to:
  /// **'تقييم الإمتثال هذا الشهر'**
  String get thisMonthComplianceAssessment;

  /// No description provided for @since.
  ///
  /// In ar, this message translates to:
  /// **'منذ'**
  String get since;

  /// No description provided for @toDay.
  ///
  /// In ar, this message translates to:
  /// **'الى اليوم'**
  String get toDay;

  /// No description provided for @departmentComplianceAssessment.
  ///
  /// In ar, this message translates to:
  /// **'تقييم امتثال القسم'**
  String get departmentComplianceAssessment;

  /// No description provided for @mostCompliantEmployee.
  ///
  /// In ar, this message translates to:
  /// **'الموظف الأكثر امتثالاً'**
  String get mostCompliantEmployee;

  /// No description provided for @leastCompliantEmployee.
  ///
  /// In ar, this message translates to:
  /// **'الموظف الأقل امتثالاً'**
  String get leastCompliantEmployee;

  /// No description provided for @searchForEmployee.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن موظف'**
  String get searchForEmployee;

  /// No description provided for @departmentEmployees.
  ///
  /// In ar, this message translates to:
  /// **'موظفين القسم'**
  String get departmentEmployees;

  /// No description provided for @complianceAssessment.
  ///
  /// In ar, this message translates to:
  /// **'تقييم الإمتثال'**
  String get complianceAssessment;

  /// No description provided for @employeeNo.
  ///
  /// In ar, this message translates to:
  /// **'رقم الموظف'**
  String get employeeNo;

  /// No description provided for @tasks.
  ///
  /// In ar, this message translates to:
  /// **'المهام'**
  String get tasks;

  /// No description provided for @lateTasks.
  ///
  /// In ar, this message translates to:
  /// **'مهام متأخرة'**
  String get lateTasks;

  /// No description provided for @completedTasks.
  ///
  /// In ar, this message translates to:
  /// **'مهام مكتملة'**
  String get completedTasks;

  /// No description provided for @incompleteTasks.
  ///
  /// In ar, this message translates to:
  /// **'مهام غير مكتملة'**
  String get incompleteTasks;

  /// No description provided for @taskTitle.
  ///
  /// In ar, this message translates to:
  /// **'عنوان المهمة'**
  String get taskTitle;

  /// No description provided for @taskDescription.
  ///
  /// In ar, this message translates to:
  /// **'وصف المهمة'**
  String get taskDescription;

  /// No description provided for @deliveryTime.
  ///
  /// In ar, this message translates to:
  /// **'وقت التسليم'**
  String get deliveryTime;

  /// No description provided for @gracePeriod.
  ///
  /// In ar, this message translates to:
  /// **'مدة السماح'**
  String get gracePeriod;

  /// No description provided for @taskRepetition.
  ///
  /// In ar, this message translates to:
  /// **'تكرار المهمة'**
  String get taskRepetition;

  /// No description provided for @daily.
  ///
  /// In ar, this message translates to:
  /// **'يومياً'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In ar, this message translates to:
  /// **'اسبوعياً'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In ar, this message translates to:
  /// **'شهرياً'**
  String get monthly;

  /// No description provided for @noRepetition.
  ///
  /// In ar, this message translates to:
  /// **'بدون تكرار'**
  String get noRepetition;

  /// No description provided for @specifyTheDayForTaskRepetition.
  ///
  /// In ar, this message translates to:
  /// **'حدد اليوم المخصص لتكرار المهمة'**
  String get specifyTheDayForTaskRepetition;

  /// No description provided for @saturday.
  ///
  /// In ar, this message translates to:
  /// **'السبت'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In ar, this message translates to:
  /// **'الأحد'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In ar, this message translates to:
  /// **'الإثنين'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In ar, this message translates to:
  /// **'الثلاثاء'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In ar, this message translates to:
  /// **'الأربعاء'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In ar, this message translates to:
  /// **'الخميس'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In ar, this message translates to:
  /// **'الجمعة'**
  String get friday;

  /// No description provided for @notesAboutTheTask.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات حول المهمة'**
  String get notesAboutTheTask;

  /// No description provided for @notesAboutTheTaskExecutionMechanism.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات حول الية تنفيذ المهمة'**
  String get notesAboutTheTaskExecutionMechanism;

  /// No description provided for @penaltyForNonCompliance.
  ///
  /// In ar, this message translates to:
  /// **'عقوبة عدم الإمتثال'**
  String get penaltyForNonCompliance;

  /// No description provided for @descriptionPenaltyForNonCompliance.
  ///
  /// In ar, this message translates to:
  /// **'وصف عقوبة عدم الإمتثال'**
  String get descriptionPenaltyForNonCompliance;

  /// No description provided for @attachFiles.
  ///
  /// In ar, this message translates to:
  /// **'إرفاق ملفات'**
  String get attachFiles;

  /// No description provided for @create.
  ///
  /// In ar, this message translates to:
  /// **'انشاء'**
  String get create;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
