import 'package:app/screens/task/task_details_screen.dart';
import 'package:shared/shared.dart';

class TaskProvider extends ChangeNotifier {
  final _storageService = StorageService();

  FirebaseFirestore get _firebaseInstance => kFirebaseInstant;

  // ///Queries
  // Query<TaskModel> get tasksMainQuery => _firebaseInstance.tasks.whereMyCompany;
  // Query<UserModel> get assignedTasksQuery => _firebaseInstance.users.whereMyCompany;

  void createTask(BuildContext context, TaskModel task) async {
    ApiService.fetch(
      context,
      callBack: () async {
        final isAdd = task.id.isEmpty;
        if (isAdd) {
          task.id = await RowIdHelper().getTaskId();
          task.createdAt = kNowDate;
        }
        final taskDocRef = _firebaseInstance.tasks.doc(task.id);
        if (task.files != null) {
          task.attachments = await _storageService.uploadFiles(MyCollections.tasks, task.files!);
        }
        taskDocRef.set(task);
        if (context.mounted) {
          if (isAdd) {
            context.pushReplacement((context) {
              return TaskDetailsScreen(task: task);
            });
          } else {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: context.appLocalization.savedSuccessfully);
          }
        }
      },
    );
  }

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
