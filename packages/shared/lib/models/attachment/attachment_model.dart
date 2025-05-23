import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@unfreezed
class AttachmentModel with _$AttachmentModel {
  factory AttachmentModel({@Default('') String url, @Default('') String name}) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) => _$AttachmentModelFromJson(json);
}
