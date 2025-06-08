// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(
  Map<String, dynamic> json,
) => _$TaskModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  deliveryDate: const TimestampSerializer().fromJson(json['deliveryDate']),
  assignedDate: const TimestampSerializer().fromJson(json['assignedDate']),
  deliveryTime: json['deliveryTime'] as String? ?? "",
  allowedDurationInMinutes:
      (json['allowedDurationInMinutes'] as num?)?.toInt() ?? 0,
  points: (json['points'] as num?)?.toInt() ?? 0,
  id: json['id'] as String? ?? "",
  startTime: json['startTime'] as String? ?? "09:00 Am",
  parentTaskId: json['parentTaskId'] as String?,
  companyId: json['companyId'] as String,
  title: json['title'] as String? ?? "",
  description: json['description'] as String? ?? "",
  status: json['status'] as String? ?? "",
  departmentId: json['departmentId'] as String? ?? "",
  violationDescription: json['violationDescription'] as String? ?? "",
  notes: json['notes'] as String? ?? "",
  repeatType: json['repeatType'] as String?,
  markedAsLate: json['markedAsLate'] as bool? ?? false,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  assignedUserIds:
      (json['assignedUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  repeatDays:
      (json['repeatDays'] as List<dynamic>).map((e) => e as String).toList(),
  userId: json['userId'] as String?,
  inCompletedTasksCount: (json['inCompletedTasksCount'] as num?)?.toInt() ?? 0,
  completedTasksCount: (json['completedTasksCount'] as num?)?.toInt() ?? 0,
  lateTasksCount: (json['lateTasksCount'] as num?)?.toInt() ?? 0,
  violationTasksCount: (json['violationTasksCount'] as num?)?.toInt() ?? 0,
  totalAssignedUsers: (json['totalAssignedUsers'] as num?)?.toInt() ?? 0,
  violation:
      json['violation'] == null
          ? null
          : LightViolationModel.fromJson(
            json['violation'] as Map<String, dynamic>,
          ),
  createdById: json['createdById'] as String,
);

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'deliveryDate': const TimestampSerializer().toJson(instance.deliveryDate),
      'assignedDate': const TimestampSerializer().toJson(instance.assignedDate),
      'deliveryTime': instance.deliveryTime,
      'allowedDurationInMinutes': instance.allowedDurationInMinutes,
      'points': instance.points,
      'id': instance.id,
      'startTime': instance.startTime,
      'parentTaskId': instance.parentTaskId,
      'companyId': instance.companyId,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'departmentId': instance.departmentId,
      'violationDescription': instance.violationDescription,
      'notes': instance.notes,
      'repeatType': instance.repeatType,
      'markedAsLate': instance.markedAsLate,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'assignedUserIds': instance.assignedUserIds,
      'repeatDays': instance.repeatDays,
      'userId': instance.userId,
      'inCompletedTasksCount': instance.inCompletedTasksCount,
      'completedTasksCount': instance.completedTasksCount,
      'lateTasksCount': instance.lateTasksCount,
      'violationTasksCount': instance.violationTasksCount,
      'totalAssignedUsers': instance.totalAssignedUsers,
      'violation': instance.violation?.toJson(),
      'createdById': instance.createdById,
    };
