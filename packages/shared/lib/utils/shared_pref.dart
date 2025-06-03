import 'dart:convert';

import 'package:shared/shared.dart';

import '../models/company/company_model.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearStorage() {
    user = null;
  }

  static UserModel? get user {
    String? value = _sharedPreferences.getString('user');
    UserModel? userModel;
    if (value != null && value.isNotEmpty && value != 'null') {
      userModel = UserModel.fromJson(jsonDecode(value));
    }
    return userModel;
  }

  static set user(UserModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('user', jsonEncode(value?.toJson()));
  }

  static bool get passedIntro => _sharedPreferences.getBool('passedIntro') ?? false;
  static set passedIntro(bool value) => _sharedPreferences.setBool('passedIntro', value);

  static String get language => _sharedPreferences.getString('language') ?? LanguageEnum.arabic;
  static set language(String value) => _sharedPreferences.setString('language', value);

  static String get theme => _sharedPreferences.getString('theme') ?? ThemeEnum.light;
  static set theme(String value) => _sharedPreferences.setString('theme', value);

  static String get countryCode =>
      _sharedPreferences.getString('countryCode') ?? kFallBackCountryCode;
  static set countryCode(String value) => _sharedPreferences.setString('countryCode', value);

  static RoleModel? get role {
    String? value = _sharedPreferences.getString('role');
    RoleModel? role;
    if (value != null && value.isNotEmpty && value != 'null') {
      role = RoleModel.fromJson(jsonDecode(value));
    }
    return role;
  }

  static set role(RoleModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('role', jsonEncode(value?.toJson()));
  }

  static CompanyModel? get company {
    String? value = _sharedPreferences.getString('company');
    CompanyModel? role;
    if (value != null && value.isNotEmpty && value != 'null') {
      role = CompanyModel.fromJson(jsonDecode(value));
    }
    return role;
  }

  static set company(CompanyModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('company', jsonEncode(value?.toJson()));
  }
}
