import 'package:shared/shared.dart';

class NotificationRouteHandler {
  static void toggle(
    BuildContext context, {
    required String? id,
    required String? type,
    Map<dynamic, dynamic>? extra,
  }) {
    try {
      if (type == NotificationType.emtithal.value || type == NotificationType.lateTask.value) {
        // context.navigate((context) {
        //   return TaskDetailsScreen(task: id);
        // });
      }
    } catch (e) {
      debugPrint("RouteError:: $e");
    }
  }
}
