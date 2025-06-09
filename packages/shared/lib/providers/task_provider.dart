import 'package:shared/shared.dart';

class TaskProvider extends ChangeNotifier {
  DocumentReference<TaskModel> getTaskDocRef(String id) {
    return kFirebaseInstant.tasks.doc(id);
  }

  Query<TaskModel> getAssignedTasksQuery(String id) {
    return kFirebaseInstant.assignedTasksQuery.orderByCreatedAtDesc.where(
      MyFields.parentTaskId,
      isEqualTo: id,
    );
  }
}
