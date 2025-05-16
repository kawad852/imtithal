import 'package:app/screens/task/task_details_screen.dart';
import 'package:shared/shared.dart';

class TaskProvider extends ChangeNotifier {
  final _storageService = StorageService();

  FirebaseFirestore get _firebaseInstance => kFirebaseInstant;

  ///Queries
  Query<TaskModel> get tasksMainQuery => _firebaseInstance.tasks.whereMyCompany;
  Query<UserModel> get userTaskQuery => _firebaseInstance.users.whereMyCompany;

  void createTask(BuildContext context, TaskModel task) async {
    ApiService.fetch(
      context,
      callBack: () async {
        task.id = await RowIdHelper().getTaskId();
        final taskDocRef = _firebaseInstance.tasks.doc(task.id);
        task.createdAt = kNowDate;
        if (task.files != null) {
          task.attachments = await _storageService.uploadFiles(MyCollections.tasks, task.files!);
        }
        taskDocRef.set(task);
        if (context.mounted) {
          context.pushReplacement((context) {
            return TaskDetailsScreen(task: task);
          });
        }
      },
    );
  }

  void addTaskToEmployees(BuildContext context, TaskModel task) async {
    ApiService.fetch(
      context,
      callBack: () async {
        final usersQuerySnapshot = await userTaskQuery.get();
        for (var user in usersQuerySnapshot.docs) {
          final userTaskDocRef = user.reference
              .collection(MyCollections.tasks)
              .taskConvertor
              .doc(task.id);
          userTaskDocRef.set(task);
        }
      },
    );
  }
}
