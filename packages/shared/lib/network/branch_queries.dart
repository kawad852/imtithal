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
}
