import '../../shared.dart';
import '../models/company/company_model.dart';

class RowIdHelper {
  Future<String> get(String key, {required int Function(RowIdModel row) onValueUpdate}) async {
    var newOrderId = 0;
    final orderIdDocumentRef = kFirebaseInstant.companies.doc(kCompanyId);
    await kFirebaseInstant.runTransaction((Transaction transaction) async {
      final snapshot = await transaction.get(orderIdDocumentRef);
      final rowId = snapshot.data()!.rowId!;
      newOrderId = onValueUpdate(rowId);
      transaction.update(orderIdDocumentRef, {'${MyFields.rowId}.$key': FieldValue.increment(1)});
    });
    return '$newOrderId';
  }
}

extension RowIdExtension on RowIdHelper {
  Future<String> getTaskId() async => get(
    'taskId',
    onValueUpdate: (row) {
      return row.taskId;
    },
  );
  Future<String> getUserId() async => get(
    'userId',
    onValueUpdate: (row) {
      return row.userId;
    },
  );
}
