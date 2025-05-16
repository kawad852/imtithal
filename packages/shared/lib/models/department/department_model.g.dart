// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentModelImpl _$$DepartmentModelImplFromJson(
  Map<String, dynamic> json,
) => _$DepartmentModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
);

Map<String, dynamic> _$$DepartmentModelImplToJson(
  _$DepartmentModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'name': instance.name,
};

_$LightDepartmentModelImpl _$$LightDepartmentModelImplFromJson(
  Map<String, dynamic> json,
) => _$LightDepartmentModelImpl(
  id: json['id'] as String?,
  name: json['name'] as String? ?? '',
);

Map<String, dynamic> _$$LightDepartmentModelImplToJson(
  _$LightDepartmentModelImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
