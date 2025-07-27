import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
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
        //   return TaskDetailsScreen(task: ,);
        // });
      } else if (type == NotificationType.violation.value) {
        context.navigate((context) {
          return ViolationDetailsScreen(
            id: id,
            violation: ViolationModel(
              user: LightUserModel(id: '', departmentId: '', displayName: ''),
              createdById: "",
            ),
          );
        });
      }
    } catch (e) {
      debugPrint("RouteError:: $e");
    }
  }
}
