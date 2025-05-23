import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'violation_model.freezed.dart';
part 'violation_model.g.dart';

@unfreezed
class ViolationModel with _$ViolationModel {
  factory ViolationModel({
    @TimestampSerializer() DateTime? createTime,
    @Default('') String id,
    @Default('') String type,
    @Default('') String notes,
    @Default('') String description,
  }) = _ViolationModel;

  factory ViolationModel.fromJson(Map<String, dynamic> json) => _$ViolationModelFromJson(json);
}
