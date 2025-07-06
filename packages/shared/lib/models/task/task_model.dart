import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../attachment/attachment_model.dart';
import '../violation/violation_model.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@unfreezed
class TaskModel with _$TaskModel {
  @JsonSerializable(explicitToJson: true)
  factory TaskModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? deliveryDate,
    @Default("") String deliveryTime,
    @Default(0) int allowedDurationInMinutes,
    @Default(0) int points,
    @Default("") String id,
    String? parentTaskId,
    required String companyId,
    @Default("") String title,
    @Default("") String description,
    @Default("") String status,
    @Default("") String departmentId,
    @Default("") String violationDescription,
    @Default("") String notes,
    required String createdById,
    String? repeatType,
    @Default(false) bool markedAsLate,
    List<AttachmentModel>? attachments,
    List<AttachmentModel>? userAttachments,
    required LightUserModel? user,
    @Default(0) int inCompletedTasksCount,
    @Default(0) int completedTasksCount,
    @Default(0) int lateTasksCount,
    @Default(0) int violationTasksCount,
    @Default(0) int totalAssignedUsers,
    LightViolationModel? violation,
    @Default([]) List<String> assignedUserIds,
    @Default([]) List<String> assignedDepartmentIds,
    @Default([]) List<LightUserModel> assignedUsers,
    required List<String> weeklyDays,
    required List<String> monthlyDays,
    @JsonKey(includeFromJson: false, includeToJson: false) UserModel? userModel,
  }) = _TaskModel;
  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  TaskModel._();

  Color indicatorColor(BuildContext context) {
    if (markedAsLate) {
      return context.colorPalette.yellowF5E;
    } else {
      final statusEnum = TaskStatusEnum.values.firstWhere((e) => e.value == status);
      switch (statusEnum) {
        case TaskStatusEnum.inReview:
          return context.colorPalette.grey8B8;
        case TaskStatusEnum.completed:
          return context.colorPalette.primary;
        case TaskStatusEnum.violated:
          return context.colorPalette.redD62;
        default:
          return context.colorPalette.grey8B8;
      }
    }
  }
}
