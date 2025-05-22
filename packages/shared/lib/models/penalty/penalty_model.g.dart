// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PenaltyModelImpl _$$PenaltyModelImplFromJson(Map<String, dynamic> json) =>
    _$PenaltyModelImpl(
      createTime: const TimestampSerializer().fromJson(json['createTime']),
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$PenaltyModelImplToJson(_$PenaltyModelImpl instance) =>
    <String, dynamic>{
      'createTime': const TimestampSerializer().toJson(instance.createTime),
      'id': instance.id,
      'type': instance.type,
    };
