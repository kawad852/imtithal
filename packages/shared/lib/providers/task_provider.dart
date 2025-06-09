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
    return kFirebaseInstant.assignedTasksQuery.orderByCreatedAtDesc.where(
      MyFields.parentTaskId,
      isEqualTo: id,
    );
  }

  CollectionReference<TaskModel> assignedTaskQuery(String userId) =>
      kFirebaseInstant.users.doc(userId).collection(MyCollections.assignedTasks).taskConvertor;

  Query<TaskModel> getTasks(BuildContext context) {
    if (kIsEmployee) {
      return assignedTaskQuery(kUserId).orderByDeliveryDateDesc;
    } else if (kIsDepartmentManager) {
      final users = context.read<List<UserModel>>();
      final userIds =
          users.where((e) => e.departmentId == kUser.departmentId).map((e) => e.id!).toList();
      return kFirebaseInstant.assignedTasks
          .where(MyFields.userId, whereIn: userIds)
          .orderByDeliveryDateDesc;
    } else {
      return kFirebaseInstant.tasks.orderByDeliveryDateDesc.whereMyCompany;
    }
  }

  Query<TaskModel> getAssignedTasksFromDate(BuildContext context, DateTime date) {
    late Query<TaskModel> query;
    final startDate = DateTime(date.year, date.month, date.day);
    final endDate = startDate.add(const Duration(days: 1));
    final filter = Filter.and(
      Filter(MyFields.deliveryDate, isGreaterThanOrEqualTo: Timestamp.fromDate(startDate)),
      Filter(MyFields.deliveryDate, isLessThan: Timestamp.fromDate(endDate)),
      Filter(MyFields.companyId, isEqualTo: kCompanyId),
    );
    query = getTasks(context).where(filter);
    return query;
  }
}
