// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HolidayModelImpl _$$HolidayModelImplFromJson(Map<String, dynamic> json) =>
    _$HolidayModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      startDate: const TimestampSerializer().fromJson(json['startDate']),
      endDate: const TimestampSerializer().fromJson(json['endDate']),
      id: json['id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$$HolidayModelImplToJson(_$HolidayModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializer().toJson(instance.endDate),
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
