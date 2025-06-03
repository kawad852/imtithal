// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationModelImpl _$$ViolationModelImplFromJson(Map<String, dynamic> json) =>
    _$ViolationModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      description: json['description'] as String? ?? '',
      companyId: json['companyId'] as String? ?? '',
      user:
          json['user'] == null
              ? null
              : LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String? ?? ViolationStatus.defaultValue,
      createdById: json['createdById'] as String,
      lastReplyBy:
          json['lastReplyBy'] == null
              ? null
              : LightUserModel.fromJson(
                json['lastReplyBy'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$ViolationModelImplToJson(
  _$ViolationModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'type': instance.type,
  'notes': instance.notes,
  'description': instance.description,
  'companyId': instance.companyId,
  'user': instance.user?.toJson(),
  'status': instance.status,
  'createdById': instance.createdById,
  'lastReplyBy': instance.lastReplyBy?.toJson(),
};

_$LightViolationModelImpl _$$LightViolationModelImplFromJson(
  Map<String, dynamic> json,
) => _$LightViolationModelImpl(
  id: json['id'] as String? ?? '',
  type: json['type'] as String? ?? '',
  status: json['status'] as String? ?? ViolationStatus.defaultValue,
);

Map<String, dynamic> _$$LightViolationModelImplToJson(
  _$LightViolationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'status': instance.status,
};
