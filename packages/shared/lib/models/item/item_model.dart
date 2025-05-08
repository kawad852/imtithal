import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@unfreezed
class ItemModel with _$ItemModel {
  @JsonSerializable(explicitToJson: true)
  factory ItemModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String name,
    @Default('') String categoryId,
    @Default('') String status,
    @Default(0) int quantity,
    @Default(0) int minimumQuantity,
    LightUserModel? user,
    required LightBranchModel branch,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(false) bool suggested,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  ItemModel._();

  Future<String> getId() async => RowIdHelper.get(RowIdHelper.itemId);
}

@unfreezed
class LightItemModel with _$LightItemModel {
  factory LightItemModel({
    @Default('') String id,
    @Default('') String name,
    @Default(0) int quantity,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(0) int minimumQuantity,
  }) = _LightItemModel;

  factory LightItemModel.fromJson(Map<String, dynamic> json) => _$LightItemModelFromJson(json);
}
