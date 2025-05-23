import 'package:shared/shared.dart';

class TaskProvider extends ChangeNotifier {
  final _storageService = StorageService();

  FirebaseFirestore get _firebaseInstance => kFirebaseInstant;

  // ///Queries
  // Query<TaskModel> get tasksMainQuery => _firebaseInstance.tasks.whereMyCompany;
  // Query<UserModel> get assignedTasksQuery => _firebaseInstance.users.whereMyCompany;

  DocumentReference<TaskModel> getTaskDocRef(String id) {
    return kFirebaseInstant.tasks.doc(id);
  }

  Query<TaskModel> getAssignedTasksQuery(String id) {
    return kFirebaseInstant.assignedTasks.orderByDesc.where(MyFields.id, isEqualTo: id);
  }

  CollectionReference<TaskModel> assignedTaskQuery(String userId) =>
      kFirebaseInstant.users.doc(userId).collection(MyCollections.assignedTasks).taskConvertor;

  Query<TaskModel> get tasksQuery {
    if (kIsEmployee) {
      return assignedTaskQuery(kUserId).orderByDesc;
    } else {
      return kFirebaseInstant.tasks.orderByDesc.whereMyCompany;
    }
  }
}
