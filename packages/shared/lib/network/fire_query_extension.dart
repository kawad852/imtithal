import 'package:shared/shared.dart';

extension FireQueryExtension<T> on Query<T> {
  Query<T> get whereMyCompany => where(MyFields.companyId, isEqualTo: kCompanyId);
  Query<T> get whereMyDepartment => where(MyFields.departmentId, isEqualTo: kCompanyId);
  Query<T> get orderByCreatedAtDesc => orderBy(MyFields.createdAt, descending: true);
  Query<T> get orderByDeliveryDateDesc => orderBy(MyFields.deliveryDate, descending: true);
  Query<T> get orderByDeliveryDateAsc => orderBy(MyFields.deliveryDate, descending: false);
}
