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
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    @Default(false) bool blocked,
    String? phoneCountryCode,
    String? phoneNum,
    @Default('') String password,
    @Default('') String jobTitle,
    List<String>? images,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class LightUserModel with _$LightUserModel {
  factory LightUserModel({String? id, String? displayName}) = _LightUserModel;

  factory LightUserModel.fromJson(Map<String, dynamic> json) => _$LightUserModelFromJson(json);
}
