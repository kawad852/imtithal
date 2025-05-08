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

  /// No description provided for @conWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get conWithGoogle;

  /// No description provided for @conWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get conWithApple;

  /// No description provided for @conWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Continue with Phone'**
  String get conWithPhone;

  /// No description provided for @regTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Nudoo!'**
  String get regTitle;

  /// No description provided for @regBody.
  ///
  /// In en, this message translates to:
  /// **'Organize your tasks, boost your productivity, and get things done effortlessly.\nSign up now to start managing your tasks like a pro!'**
  String get regBody;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'Oops, Something went wrong !'**
  String get generalError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection Error'**
  String get networkError;

  /// No description provided for @generalErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get generalErrorTitle;

  /// No description provided for @generalErrorBody.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again later or contact support.'**
  String get generalErrorBody;

  /// No description provided for @connectionErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get connectionErrorTitle;

  /// No description provided for @connectionErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Unable to reach the server. Please check your internet connection and try again.'**
  String get connectionErrorBody;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @serverErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Unavailable'**
  String get serverErrorTitle;

  /// No description provided for @serverErrorBody.
  ///
  /// In en, this message translates to:
  /// **'We\'re currently having trouble retrieving data from the server. Please try again later.'**
  String get serverErrorBody;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @authFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get authFailed;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @addToBasket.
  ///
  /// In en, this message translates to:
  /// **'Add to basket'**
  String get addToBasket;

  /// No description provided for @locationServiceDisabledMsg.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled in your device'**
  String get locationServiceDisabledMsg;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @basketEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Basket is Empty'**
  String get basketEmptyTitle;

  /// No description provided for @basketEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Start adding items to your basket by exploring our collection. Once you find something you like, simply tap \'Add to Basket\' to begin your shopping journey. Happy shopping!'**
  String get basketEmptyBody;

  /// No description provided for @contShipping.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get contShipping;

  /// No description provided for @cont.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get cont;

  /// No description provided for @deliveryInfo.
  ///
  /// In en, this message translates to:
  /// **'Delivery arrives in 30-40 minutes.'**
  String get deliveryInfo;

  /// No description provided for @shoppingBasket.
  ///
  /// In en, this message translates to:
  /// **'Shopping Basket'**
  String get shoppingBasket;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @basket.
  ///
  /// In en, this message translates to:
  /// **'Basket'**
  String get basket;

  /// No description provided for @mealAdded.
  ///
  /// In en, this message translates to:
  /// **'Meal Added'**
  String get mealAdded;

  /// No description provided for @itemNotAvailableMsg.
  ///
  /// In en, this message translates to:
  /// **'Item no longer available'**
  String get itemNotAvailableMsg;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @itemDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get itemDeleteTitle;

  /// No description provided for @itemBasketDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the item from basket ?'**
  String get itemBasketDeleteBody;

  /// No description provided for @addedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Added Successfully'**
  String get addedSuccessfully;

  /// No description provided for @successfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Successfully Updated'**
  String get successfullyUpdated;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Addresses'**
  String get deliveryAddress;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @managingHajjOperations.
  ///
  /// In en, this message translates to:
  /// **'Managing Hajj Warehouse Operations'**
  String get managingHajjOperations;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered.'**
  String get emailAlreadyInUse;

  /// No description provided for @emailNotFount.
  ///
  /// In en, this message translates to:
  /// **'No user found with this email.'**
  String get emailNotFount;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password for this email.'**
  String get wrongPassword;

  /// No description provided for @khaled.
  ///
  /// In en, this message translates to:
  /// **'Khaled'**
  String get khaled;

  /// No description provided for @searchCountryOrCode.
  ///
  /// In en, this message translates to:
  /// **'إبحث عن اسم البلد او الرمز'**
  String get searchCountryOrCode;

  /// No description provided for @faris.
  ///
  /// In en, this message translates to:
  /// **'Faris'**
  String get faris;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'privacyPolicy'**
  String get privacyPolicy;
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
