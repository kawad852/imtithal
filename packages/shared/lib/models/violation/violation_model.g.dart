// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationModelImpl _$$ViolationModelImplFromJson(Map<String, dynamic> json) =>
    _$ViolationModelImpl(
      createTime: const TimestampSerializer().fromJson(json['createTime']),
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$ViolationModelImplToJson(
  _$ViolationModelImpl instance,
) => <String, dynamic>{
  'createTime': const TimestampSerializer().toJson(instance.createTime),
  'id': instance.id,
  'type': instance.type,
  'notes': instance.notes,
  'description': instance.description,
};
