import '../../shared.dart';

class RowIdHelper {
  Future<String> get(String id) async {
    var newOrderId = 0;
    final orderIdDocumentRef = kFirebaseInstant
        .collection(MyCollections.settings)
        .doc(kRowIdDocument);
    await kFirebaseInstant.runTransaction((Transaction transaction) async {
      final snapshot = await transaction.get(orderIdDocumentRef);
      newOrderId = snapshot.data()![id];
      transaction.update(orderIdDocumentRef, {id: FieldValue.increment(1)});
    });
    return '$newOrderId';
  }
}

extension RowIdExtension on RowIdHelper {
  Future<String> getTaskId() async => get('task_id');
}
