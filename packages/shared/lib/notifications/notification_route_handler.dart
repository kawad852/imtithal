import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class NotificationRouteHandler {
  static void toggle(
    BuildContext context, {
    required String? id,
    required String? type,
    required String? userId,
    Map<dynamic, dynamic>? extra,
  }) {
    try {
      if (type == NotificationType.emtithal.value || type == NotificationType.lateTask.value) {
        // context.navigate((context) {
        //   return TaskDetailsScreen(task: ,);
        // });
      } else if (type == NotificationType.violation.value) {
        context.navigate((context) {
          return ViolationDetailsScreen(id: id, violation: null, userId: userId);
        });
      }
    } catch (e) {
      debugPrint("RouteError:: $e");
    }
  }
}
