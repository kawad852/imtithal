import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@unfreezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(explicitToJson: true)
  factory CategoryModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String name,
    required String branchId,
    required LightUserModel user,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  CategoryModel._();

  Future<String> getId() async => RowIdHelper.get(RowIdHelper.categoryId);
}

@unfreezed
class LightCategoryModel with _$LightCategoryModel {
  factory LightCategoryModel({@Default('') String id, @Default('') String name}) =
      _LightCategoryModel;

  factory LightCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$LightCategoryModelFromJson(json);
}
