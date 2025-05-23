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
    @Default("") String id,
    required String companyId,
    @Default("") String title,
    @Default("") String description,
    @Default("") String status,
    @Default("") String departmentId,
    @Default("") String penaltyDescription,
    @Default("") String notes,
    String? repeatType,
    @Default(false) bool markedAsLate,
    List<AttachmentModel>? attachments,
    @Default([]) List<String> assignedUserIds,
    required List<String> repeatDays,
    LightUserModel? user,
    @Default(0) int inCompletedTasksCount,
    @Default(0) int completedTasksCount,
    @Default(0) int lateTasksCount,
    @Default(0) int penaltyTasksCount,
    @Default(0) int totalAssignedUsers,
    LightViolationModel? violation,
    required String createdById,
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
        case TaskStatusEnum.violation:
          return context.colorPalette.redD62;
        default:
          return context.colorPalette.grey8B8;
      }
    }
  }

  // (Color cardColor, Color indicatorColor) getStatusColors(BuildContext context) {
  //   final primaryColor = context.colorPalette.primary;
  //   final greyLightColor = context.colorPalette.greyF2F;
  //   final greyDarkColor = context.colorPalette.greyC4C;
  //   final yellowF5E = context.colorPalette.yellowF5E;
  //   if (markedAsLate) {
  //     return (
  //       status == TaskStatusEnum.completed.value ? context.colorPalette.greyE2E : greyLightColor,
  //       context.colorPalette.yellowC02,
  //     );
  //   } else if (status == TaskStatusEnum.completed.value) {
  //     return (context.colorPalette.greyE2E, primaryColor);
  //   } else {
  //     return (greyLightColor, greyDarkColor);
  //   }
  // }

  //
  // (String, List<String>) get values {
  //   var images = <String>[];
  //   var imagesField = '';
  //   final isCompleted = status == TaskStatusEnum.completed.value;
  //   final isNotStarted = status == TaskStatusEnum.notStarted.value;
  //   final isInProgress = status == TaskStatusEnum.inProgress.value;
  //   if (isCompleted) {
  //     images = [...startingImages, ...endingImages];
  //   } else if (isNotStarted) {
  //     images = startingImages;
  //     imagesField = MyFields.startingImages;
  //   } else if (isInProgress) {
  //     images = endingImages;
  //     imagesField = MyFields.endingImages;
  //   }
  //   return (imagesField, images);
  // }
}
