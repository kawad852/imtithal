import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

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
    String? repeatType,
    @Default(false) bool markedAsLate,
    required List<String> attachments,
    required List<String> repeatDays,
  }) = _TaskModel;
  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  TaskModel._();

  // (Color cardColor, Color indicatorColor) getStatusColors(BuildContext context) {
  //   final primaryColor = context.colorPalette.primary;
  //   final greyLightColor = context.colorPalette.greyF2F;
  //   final greyDarkColor = context.colorPalette.greyC4C;
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
