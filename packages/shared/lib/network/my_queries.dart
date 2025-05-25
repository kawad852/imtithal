import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

import '../models/country/country_model.dart';
import '../models/promo_code/promo_code_model.dart';
import '../models/store/store_model.dart';

extension CollectionReferenceExtension on FirebaseFirestore {
  CollectionReference<TaskModel> get tasks => collection(MyCollections.tasks).taskConvertor;
  CollectionReference<TaskModel> get assignedTasks =>
      collectionGroup(MyCollections.assignedTasks).taskConvertor;

  CollectionReference<UserModel> get users => collection(MyCollections.users).userConvertor;

  CollectionReference<ViolationModel> userViolations(String userId) =>
      users.doc(userId).collection(MyCollections.violations).violationConvertor;
  CollectionReference<TaskModel> userAssignedTasks(String userId) =>
      users.doc(userId).collection(MyCollections.assignedTasks).taskConvertor;

  CollectionReference<StoreModel> get foodStores =>
      collection(MyCollections.foodStores).withConverter<StoreModel>(
        fromFirestore: (snapshot, _) => StoreModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

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

  CollectionReference<PromoCodeModel> get promoCodes =>
      collection(MyCollections.promoCodes).withConverter<PromoCodeModel>(
        fromFirestore: (snapshot, _) => PromoCodeModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  DocumentReference<ProductModel> meal(String storeId, String productId) {
    return foodStores
        .doc(storeId)
        .collection("menu")
        .doc(productId)
        .withConverter<ProductModel>(
          fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson(),
        );
  }

  CollectionReference<ProductModel> get products =>
      collection(MyCollections.products).withConverter<ProductModel>(
        fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<PolicyModel> get policies =>
      collection(MyCollections.policies).withConverter<PolicyModel>(
        fromFirestore: (snapshot, _) => PolicyModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
