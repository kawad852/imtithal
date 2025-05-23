import 'package:shared/models/violation/violation_model.dart';

import '../../shared.dart';

extension FireConvertors on Query {
  get taskConvertor => withConverter<TaskModel>(
    fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
    toFirestore: (snapshot, _) => snapshot.toJson(),
  );

  get userConvertor => withConverter<UserModel>(
    fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
    toFirestore: (snapshot, _) => snapshot.toJson(),
  );

  get violationConvertor => withConverter<ViolationModel>(
    fromFirestore: (snapshot, _) => ViolationModel.fromJson(snapshot.data()!),
    toFirestore: (snapshot, _) => snapshot.toJson(),
  );
}
