// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  id: json['id'] as String?,
  displayName: json['displayName'] as String? ?? '',
  email: json['email'] as String? ?? '',
  deviceToken: json['deviceToken'] as String?,
  role: json['role'] as String?,
  languageCode: json['languageCode'] as String?,
  profilePhoto: json['profilePhoto'] as String?,
  blocked: json['blocked'] as bool? ?? false,
  password: json['password'] as String? ?? '',
  jobTitle: json['jobTitle'] as String? ?? '',
  companyId: json['companyId'] as String? ?? '',
  taskIds:
      (json['taskIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  inCompletedTasksCount: (json['inCompletedTasksCount'] as num?)?.toInt() ?? 0,
  completedTasksCount: (json['completedTasksCount'] as num?)?.toInt() ?? 0,
  lateTasksCount: (json['lateTasksCount'] as num?)?.toInt() ?? 0,
  penaltyTasksCount: (json['penaltyTasksCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'deviceToken': instance.deviceToken,
      'role': instance.role,
      'languageCode': instance.languageCode,
      'profilePhoto': instance.profilePhoto,
      'blocked': instance.blocked,
      'password': instance.password,
      'jobTitle': instance.jobTitle,
      'companyId': instance.companyId,
      'taskIds': instance.taskIds,
      'inCompletedTasksCount': instance.inCompletedTasksCount,
      'completedTasksCount': instance.completedTasksCount,
      'lateTasksCount': instance.lateTasksCount,
      'penaltyTasksCount': instance.penaltyTasksCount,
    };

_$LightUserModelImpl _$$LightUserModelImplFromJson(Map<String, dynamic> json) =>
    _$LightUserModelImpl(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$LightUserModelImplToJson(
  _$LightUserModelImpl instance,
) => <String, dynamic>{'id': instance.id, 'displayName': instance.displayName};
