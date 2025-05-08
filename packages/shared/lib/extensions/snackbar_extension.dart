import 'package:app/screens_exports.dart';

import '../shared.dart';

extension SnackbarExtension on BuildContext {
  void showSnackBar(String msg, {int duration = 4, SnackBarAction? action}) {
    ScaffoldMessenger.of(this)
        .showSnackBar(
          SnackBar(
            content: Text(msg),
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: duration),
            action: action,
          ),
        )
        .closed
        .then((value) {
          ScaffoldMessenger.of(rootNavigatorKey.currentContext!).removeCurrentSnackBar();
        });
  }
}
