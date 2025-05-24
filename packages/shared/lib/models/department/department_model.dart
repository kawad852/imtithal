import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'department_model.freezed.dart';
part 'department_model.g.dart';

@unfreezed
class DepartmentModel with _$DepartmentModel {
  @JsonSerializable(explicitToJson: true)
  factory DepartmentModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String name,
  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => _$DepartmentModelFromJson(json);
}

@unfreezed
class LightDepartmentModel with _$LightDepartmentModel {
  @JsonSerializable(explicitToJson: true)
  factory LightDepartmentModel({String? id, @Default('') String name}) = _LightDepartmentModel;

  factory LightDepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$LightDepartmentModelFromJson(json);
}
