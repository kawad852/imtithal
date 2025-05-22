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

  Stream<List<UserModel>> getTaskUsers(String taskId) {
    return kFirebaseInstant.users
        .where(MyFields.taskIds, arrayContains: taskId)
        .snapshots()
        .map((e) => e.docs.map((e) => e.data()).toList());
  }

  Stream<List<dynamic>> getTaskAndUsers(String id) {
    late Stream<TaskModel> taskStream;

    taskStream = kFirebaseInstant.tasks.doc(id).snapshots().map((e) => e.data()!);
    final usersStream = getTaskUsers(id);

    return Rx.combineLatest2<TaskModel, List<UserModel>, List<dynamic>>(taskStream, usersStream, (
      s1,
      s2,
    ) {
      return [s1, s2];
    });
  }
}
