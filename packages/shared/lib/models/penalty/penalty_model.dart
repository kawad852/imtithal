import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'penalty_model.freezed.dart';
part 'penalty_model.g.dart';

@unfreezed
class PenaltyModel with _$PenaltyModel {
  factory PenaltyModel({
    @TimestampSerializer() DateTime? createTime,
    @Default('') String id,
    @Default('') String type,
  }) = _PenaltyModel;

  factory PenaltyModel.fromJson(Map<String, dynamic> json) => _$PenaltyModelFromJson(json);
}
