import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'holiday_model.freezed.dart';
part 'holiday_model.g.dart';

@unfreezed
class HolidayModel with _$HolidayModel {
  @JsonSerializable(explicitToJson: true)
  factory HolidayModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startDate,
    @TimestampSerializer() DateTime? endDate,
    @Default("") String id,
    @Default("") String title,
    @Default("") String description,
  }) = _HolidayModel;
  factory HolidayModel.fromJson(Map<String, dynamic> json) => _$HolidayModelFromJson(json);
}
