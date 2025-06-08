import '../../shared.dart';
import '../models/company/company_model.dart';

class RowIdHelper {
  Future<String> get(
    String key, {
    required int Function(RowIdModel row) onValueUpdate,
    String? companyId,
  }) async {
    var newOrderId = 0;
    final orderIdDocumentRef = kFirebaseInstant.companies.doc(companyId ?? kCompanyId);
    await kFirebaseInstant.runTransaction((Transaction transaction) async {
      final snapshot = await transaction.get(orderIdDocumentRef);
      final rowId = snapshot.data()!.rowId!;
      newOrderId = onValueUpdate(rowId);
      final field = '${MyFields.rowId}.$key';
      transaction.update(orderIdDocumentRef, {field: FieldValue.increment(1)});
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
  Future<String> getAssignedTaskId() async => get(
    'assignedTaskId',
    onValueUpdate: (row) {
      return row.assignedTaskId;
    },
  );
  Future<String> getUserId({String? companyId}) async => get(
    'userId',
    companyId: companyId,
    onValueUpdate: (row) {
      return row.userId;
    },
  );
}
