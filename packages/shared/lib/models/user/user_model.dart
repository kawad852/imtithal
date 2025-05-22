import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    @Default('') String displayName,
    @Default('') String email,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    @Default(false) bool blocked,
    @Default('') String password,
    @Default('') String jobTitle,
    @Default('') String companyId,
    @Default('') String departmentId,
    @Default([]) List<String> taskIds,
    @Default(0) int inCompletedTasksCount,
    @Default(0) int completedTasksCount,
    @Default(0) int lateTasksCount,
    @Default(0) int penaltyTasksCount,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(false) bool selected,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class LightUserModel with _$LightUserModel {
  factory LightUserModel({String? id, String? displayName}) = _LightUserModel;

  factory LightUserModel.fromJson(Map<String, dynamic> json) => _$LightUserModelFromJson(json);
}
