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
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      lastReply:
          json['lastReply'] == null
              ? null
              : ViolationReplyModel.fromJson(
                json['lastReply'] as Map<String, dynamic>,
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
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
  'lastReply': instance.lastReply?.toJson(),
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

_$ViolationReplyModelImpl _$$ViolationReplyModelImplFromJson(
  Map<String, dynamic> json,
) => _$ViolationReplyModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  id: json['id'] as String? ?? '',
  comment: json['comment'] as String? ?? '',
  userId: json['userId'] as String? ?? '',
  status: json['status'] as String? ?? ViolationStatus.defaultValue,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ViolationReplyModelImplToJson(
  _$ViolationReplyModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'comment': instance.comment,
  'userId': instance.userId,
  'status': instance.status,
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
};
