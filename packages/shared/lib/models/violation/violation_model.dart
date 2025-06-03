import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/enums/violation_enums.dart';
import 'package:shared/models/user/user_model.dart';

import '../../helper/time_stamp_serializer.dart';

part 'violation_model.freezed.dart';
part 'violation_model.g.dart';

@unfreezed
class ViolationModel with _$ViolationModel {
  @JsonSerializable(explicitToJson: true)
  factory ViolationModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String type,
    @Default('') String notes,
    @Default('') String description,
    @Default('') String companyId,
    LightUserModel? user,
    @Default(ViolationStatus.defaultValue) String status,
    required String createdById,
    LightUserModel? lastReplyBy,
  }) = _ViolationModel;

  factory ViolationModel.fromJson(Map<String, dynamic> json) => _$ViolationModelFromJson(json);
}

@unfreezed
class LightViolationModel with _$LightViolationModel {
  factory LightViolationModel({
    @Default('') String id,
    @Default('') String type,
    @Default(ViolationStatus.defaultValue) String status,
  }) = _LightViolationModel;

  factory LightViolationModel.fromJson(Map<String, dynamic> json) =>
      _$LightViolationModelFromJson(json);
}
