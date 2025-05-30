import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? workStartDate,
    String? id,
    @Default('') String displayName,
    @Default('') String email,
    @Default('') String username,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    @Default(false) bool blocked,
    @Default(0.0) double salary,
    @Default('') String password,
    @Default('') String address,
    @Default('') String jobTitle,
    @Default('') String companyId,
    String? departmentId,
    @Default([]) List<String> taskIds,
    @Default(0) int inCompletedTasksCount,
    @Default(0) int completedTasksCount,
    @Default(0) int lateTasksCount,
    @Default(0) int penaltyTasksCount,
    @Default(0) int unReadNotificationsCount,
    String? createdById,
    String? phoneCountryCode,
    String? phoneNum,
    @Default('') String nationalNumber,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(false) bool selected,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(0) int imtithalPercentage,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(0) int violatedCount,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class LightUserModel with _$LightUserModel {
  factory LightUserModel({@Default('') String id, required String? departmentId}) = _LightUserModel;

  factory LightUserModel.fromJson(Map<String, dynamic> json) => _$LightUserModelFromJson(json);
}
