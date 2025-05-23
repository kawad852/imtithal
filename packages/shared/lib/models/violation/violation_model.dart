import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'violation_model.freezed.dart';
part 'violation_model.g.dart';

@unfreezed
class ViolationModel with _$ViolationModel {
  factory ViolationModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String type,
    @Default('') String notes,
    @Default('') String description,
    required String createdById,
  }) = _ViolationModel;

  factory ViolationModel.fromJson(Map<String, dynamic> json) => _$ViolationModelFromJson(json);
}

@unfreezed
class LightViolationModel with _$LightViolationModel {
  factory LightViolationModel({@Default('') String id, @Default('') String type}) =
      _LightViolationModel;

  factory LightViolationModel.fromJson(Map<String, dynamic> json) =>
      _$LightViolationModelFromJson(json);
}
