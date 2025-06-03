import 'package:app/screens/base/app_nav_bar.dart';

import '../shared.dart';

extension NavigationExtension on BuildContext {
  String get currentRoutePath => GoRouter.of(this).routeInformationProvider.value.uri.path;

  Future<T?> navigate<T>(WidgetBuilder builder, {bool fullscreenDialog = false, String? name}) {
    return Navigator.push<T?>(
      this,
      MaterialPageRoute(
        builder: builder,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: name),
      ),
    ).then((value) => value);
  }

  Future<T?> pushReplacement2<T>(
    WidgetBuilder builder, {
    bool fullscreenDialog = false,
    String? name,
  }) {
    return Navigator.pushReplacement<T?, T?>(
      this,
      MaterialPageRoute(
        builder: builder,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: name),
      ),
    ).then((value) => value);
  }

  Future<T?> pushAndRemoveUntil<T>(WidgetBuilder builder) {
    return Navigator.pushAndRemoveUntil<T?>(
      this,
      MaterialPageRoute(builder: builder),
      (route) => false,
    ).then((value) => value);
  }

  void goToNavBar() {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (context) {
          return const AppNavBar();
        },
      ),
      (route) => false,
    );
  }

  void back([value]) => Navigator.pop(this, value);
}
