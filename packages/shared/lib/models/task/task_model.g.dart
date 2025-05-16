// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      deliveryDate: const TimestampSerializer().fromJson(json['deliveryDate']),
      deliveryTime: json['deliveryTime'] as String? ?? "",
      allowedDurationInMinutes:
          (json['allowedDurationInMinutes'] as num?)?.toInt() ?? 0,
      id: json['id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      status: json['status'] as String? ?? "",
      departmentId: json['departmentId'] as String? ?? "",
      markedAsLate: json['markedAsLate'] as bool? ?? false,
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'deliveryDate': const TimestampSerializer().toJson(instance.deliveryDate),
      'deliveryTime': instance.deliveryTime,
      'allowedDurationInMinutes': instance.allowedDurationInMinutes,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'departmentId': instance.departmentId,
      'markedAsLate': instance.markedAsLate,
      'attachments': instance.attachments,
    };
