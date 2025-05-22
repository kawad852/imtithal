// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'penalty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PenaltyModel _$PenaltyModelFromJson(Map<String, dynamic> json) {
  return _PenaltyModel.fromJson(json);
}

/// @nodoc
mixin _$PenaltyModel {
  @TimestampSerializer()
  DateTime? get createTime => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createTime(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;

  /// Serializes this PenaltyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PenaltyModelCopyWith<PenaltyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PenaltyModelCopyWith<$Res> {
  factory $PenaltyModelCopyWith(
    PenaltyModel value,
    $Res Function(PenaltyModel) then,
  ) = _$PenaltyModelCopyWithImpl<$Res, PenaltyModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createTime,
    String id,
    String type,
  });
}

/// @nodoc
class _$PenaltyModelCopyWithImpl<$Res, $Val extends PenaltyModel>
    implements $PenaltyModelCopyWith<$Res> {
  _$PenaltyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createTime = freezed,
    Object? id = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            createTime:
                freezed == createTime
                    ? _value.createTime
                    : createTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PenaltyModelImplCopyWith<$Res>
    implements $PenaltyModelCopyWith<$Res> {
  factory _$$PenaltyModelImplCopyWith(
    _$PenaltyModelImpl value,
    $Res Function(_$PenaltyModelImpl) then,
  ) = __$$PenaltyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createTime,
    String id,
    String type,
  });
}

/// @nodoc
class __$$PenaltyModelImplCopyWithImpl<$Res>
    extends _$PenaltyModelCopyWithImpl<$Res, _$PenaltyModelImpl>
    implements _$$PenaltyModelImplCopyWith<$Res> {
  __$$PenaltyModelImplCopyWithImpl(
    _$PenaltyModelImpl _value,
    $Res Function(_$PenaltyModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createTime = freezed,
    Object? id = null,
    Object? type = null,
  }) {
    return _then(
      _$PenaltyModelImpl(
        createTime:
            freezed == createTime
                ? _value.createTime
                : createTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PenaltyModelImpl implements _PenaltyModel {
  _$PenaltyModelImpl({
    @TimestampSerializer() this.createTime,
    this.id = '',
    this.type = '',
  });

  factory _$PenaltyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PenaltyModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createTime;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String type;

  @override
  String toString() {
    return 'PenaltyModel(createTime: $createTime, id: $id, type: $type)';
  }

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PenaltyModelImplCopyWith<_$PenaltyModelImpl> get copyWith =>
      __$$PenaltyModelImplCopyWithImpl<_$PenaltyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PenaltyModelImplToJson(this);
  }
}

abstract class _PenaltyModel implements PenaltyModel {
  factory _PenaltyModel({
    @TimestampSerializer() DateTime? createTime,
    String id,
    String type,
  }) = _$PenaltyModelImpl;

  factory _PenaltyModel.fromJson(Map<String, dynamic> json) =
      _$PenaltyModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createTime;
  @TimestampSerializer()
  set createTime(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get type;
  set type(String value);

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PenaltyModelImplCopyWith<_$PenaltyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
