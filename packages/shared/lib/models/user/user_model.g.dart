// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  workStartDate: const TimestampSerializer().fromJson(json['workStartDate']),
  id: json['id'] as String?,
  displayName: json['displayName'] as String? ?? '',
  email: json['email'] as String? ?? '',
  deviceToken: json['deviceToken'] as String?,
  role: json['role'] as String?,
  languageCode: json['languageCode'] as String?,
  profilePhoto: json['profilePhoto'] as String?,
  blocked: json['blocked'] as bool? ?? false,
  phoneCountryCode: json['phoneCountryCode'] as String?,
  phoneNum: json['phoneNum'] as String?,
  password: json['password'] as String? ?? '',
  jobTitle: json['jobTitle'] as String? ?? '',
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$UserModelImplToJson(
  _$UserModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'workStartDate': const TimestampSerializer().toJson(instance.workStartDate),
  'id': instance.id,
  'displayName': instance.displayName,
  'email': instance.email,
  'deviceToken': instance.deviceToken,
  'role': instance.role,
  'languageCode': instance.languageCode,
  'profilePhoto': instance.profilePhoto,
  'blocked': instance.blocked,
  'phoneCountryCode': instance.phoneCountryCode,
  'phoneNum': instance.phoneNum,
  'password': instance.password,
  'jobTitle': instance.jobTitle,
  'images': instance.images,
};

_$LightUserModelImpl _$$LightUserModelImplFromJson(Map<String, dynamic> json) =>
    _$LightUserModelImpl(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$LightUserModelImplToJson(
  _$LightUserModelImpl instance,
) => <String, dynamic>{'id': instance.id, 'displayName': instance.displayName};
