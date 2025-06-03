import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

import '../models/company/company_model.dart';
import '../models/country/country_model.dart';
import '../models/notification/notification_model.dart';

extension CollectionReferenceExtension on FirebaseFirestore {
  CollectionReference<TaskModel> get tasks => collection(MyCollections.tasks).taskConvertor;
  Query<TaskModel> get assignedTasks => collectionGroup(MyCollections.assignedTasks).taskConvertor;
  Query<TaskModel> get assignedTasksQuery =>
      collectionGroup(MyCollections.assignedTasks).taskConvertor;

  CollectionReference<UserModel> get users => collection(MyCollections.users).userConvertor;

  Query<ViolationModel> get violations =>
      collectionGroup(MyCollections.violations).violationConvertor;
  CollectionReference<ViolationModel> userViolations(String userId) =>
      users.doc(userId).collection(MyCollections.violations).violationConvertor;
  CollectionReference<TaskModel> userAssignedTasks(String userId) =>
      users.doc(userId).collection(MyCollections.assignedTasks).taskConvertor;

  CollectionReference<CountryModel> get countries =>
      collection("countries").withConverter<CountryModel>(
        fromFirestore: (snapshot, _) => CountryModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<DepartmentModel> get departments => collection(MyCollections.companies)
      .doc(kCompanyId)
      .collection(MyCollections.departments)
      .withConverter<DepartmentModel>(
        fromFirestore: (snapshot, _) => DepartmentModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<NotificationModel> notifications(String parentId) => users
      .doc(parentId)
      .collection(MyCollections.notifications)
      .withConverter<NotificationModel>(
        fromFirestore: (snapshot, _) => NotificationModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<PolicyModel> get policies =>
      collection(MyCollections.policies).withConverter<PolicyModel>(
        fromFirestore: (snapshot, _) => PolicyModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<CompanyModel> get companies =>
      collection(MyCollections.companies).withConverter<CompanyModel>(
        fromFirestore: (snapshot, _) => CompanyModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<RoleModel> get roles =>
      collection(MyCollections.roles).withConverter<RoleModel>(
        fromFirestore: (snapshot, _) => RoleModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
