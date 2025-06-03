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
  username: json['username'] as String? ?? '',
  deviceToken: json['deviceToken'] as String?,
  role: json['role'] as String?,
  roleId: json['roleId'] as String?,
  languageCode: json['languageCode'] as String?,
  profilePhoto: json['profilePhoto'] as String?,
  blocked: json['blocked'] as bool? ?? false,
  salary: (json['salary'] as num?)?.toDouble() ?? 0.0,
  password: json['password'] as String? ?? '',
  address: json['address'] as String? ?? '',
  jobTitle: json['jobTitle'] as String? ?? '',
  companyId: json['companyId'] as String? ?? '',
  departmentId: json['departmentId'] as String?,
  taskIds:
      (json['taskIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  inCompletedTasksCount: (json['inCompletedTasksCount'] as num?)?.toInt() ?? 0,
  completedTasksCount: (json['completedTasksCount'] as num?)?.toInt() ?? 0,
  lateTasksCount: (json['lateTasksCount'] as num?)?.toInt() ?? 0,
  penaltyTasksCount: (json['penaltyTasksCount'] as num?)?.toInt() ?? 0,
  unReadNotificationsCount:
      (json['unReadNotificationsCount'] as num?)?.toInt() ?? 0,
  createdById: json['createdById'] as String?,
  phoneCountryCode: json['phoneCountryCode'] as String?,
  phoneNum: json['phoneNum'] as String?,
  nationalNumber: json['nationalNumber'] as String? ?? '',
);

Map<String, dynamic> _$$UserModelImplToJson(
  _$UserModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'workStartDate': const TimestampSerializer().toJson(instance.workStartDate),
  'id': instance.id,
  'displayName': instance.displayName,
  'email': instance.email,
  'username': instance.username,
  'deviceToken': instance.deviceToken,
  'role': instance.role,
  'roleId': instance.roleId,
  'languageCode': instance.languageCode,
  'profilePhoto': instance.profilePhoto,
  'blocked': instance.blocked,
  'salary': instance.salary,
  'password': instance.password,
  'address': instance.address,
  'jobTitle': instance.jobTitle,
  'companyId': instance.companyId,
  'departmentId': instance.departmentId,
  'taskIds': instance.taskIds,
  'inCompletedTasksCount': instance.inCompletedTasksCount,
  'completedTasksCount': instance.completedTasksCount,
  'lateTasksCount': instance.lateTasksCount,
  'penaltyTasksCount': instance.penaltyTasksCount,
  'unReadNotificationsCount': instance.unReadNotificationsCount,
  'createdById': instance.createdById,
  'phoneCountryCode': instance.phoneCountryCode,
  'phoneNum': instance.phoneNum,
  'nationalNumber': instance.nationalNumber,
};

_$LightUserModelImpl _$$LightUserModelImplFromJson(Map<String, dynamic> json) =>
    _$LightUserModelImpl(
      id: json['id'] as String? ?? '',
      departmentId: json['departmentId'] as String?,
    );

Map<String, dynamic> _$$LightUserModelImplToJson(
  _$LightUserModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'departmentId': instance.departmentId,
};
