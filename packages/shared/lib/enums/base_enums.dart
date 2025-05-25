import '../shared.dart';

class LanguageEnum {
  static const String english = 'en';
  static const String arabic = 'ar';
}

class ThemeEnum {
  static const String light = 'light';
  static const String dark = 'dark';
}

class AuthProviders {
  static const String google = 'google';
  static const String apple = 'apple';
  static const String phone = 'phone';
  static const String email = 'email';
}

enum ActionType { add, edit, delete }

enum RoleEnum {
  admin('ADMIN'), //admin@gmail.com
  emtithalManager('EMTITHAL-MANAGER'), //khaled@gmail.com
  departmentManager('DEPARTMENT-MANAGER'), //faris@gmail.com
  employee('EMPLOYEE'); //osama@gmail.com

  final String value;

  const RoleEnum(this.value);

  static String getRoleLabel(BuildContext context, RoleEnum value) {
    switch (value) {
      case RoleEnum.admin:
        return context.appLocalization.admin;
      case RoleEnum.emtithalManager:
        return context.appLocalization.manager;
      case RoleEnum.departmentManager:
        return context.appLocalization.departmentManager;
      case RoleEnum.employee:
        return context.appLocalization.employee;
    }
  }
}

enum PolicyEnum { policy, laws }
