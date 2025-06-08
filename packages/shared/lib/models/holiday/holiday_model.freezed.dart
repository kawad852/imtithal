// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HolidayModel _$HolidayModelFromJson(Map<String, dynamic> json) {
  return _HolidayModel.fromJson(json);
}

/// @nodoc
mixin _$HolidayModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set startDate(DateTime? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get endDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set endDate(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;

  /// Serializes this HolidayModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HolidayModelCopyWith<HolidayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayModelCopyWith<$Res> {
  factory $HolidayModelCopyWith(
    HolidayModel value,
    $Res Function(HolidayModel) then,
  ) = _$HolidayModelCopyWithImpl<$Res, HolidayModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startDate,
    @TimestampSerializer() DateTime? endDate,
    String id,
    String title,
    String description,
  });
}

/// @nodoc
class _$HolidayModelCopyWithImpl<$Res, $Val extends HolidayModel>
    implements $HolidayModelCopyWith<$Res> {
  _$HolidayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            startDate:
                freezed == startDate
                    ? _value.startDate
                    : startDate // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            endDate:
                freezed == endDate
                    ? _value.endDate
                    : endDate // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HolidayModelImplCopyWith<$Res>
    implements $HolidayModelCopyWith<$Res> {
  factory _$$HolidayModelImplCopyWith(
    _$HolidayModelImpl value,
    $Res Function(_$HolidayModelImpl) then,
  ) = __$$HolidayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startDate,
    @TimestampSerializer() DateTime? endDate,
    String id,
    String title,
    String description,
  });
}

/// @nodoc
class __$$HolidayModelImplCopyWithImpl<$Res>
    extends _$HolidayModelCopyWithImpl<$Res, _$HolidayModelImpl>
    implements _$$HolidayModelImplCopyWith<$Res> {
  __$$HolidayModelImplCopyWithImpl(
    _$HolidayModelImpl _value,
    $Res Function(_$HolidayModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(
      _$HolidayModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        startDate:
            freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        endDate:
            freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HolidayModelImpl implements _HolidayModel {
  _$HolidayModelImpl({
    @TimestampSerializer() this.createdAt,
    @TimestampSerializer() this.startDate,
    @TimestampSerializer() this.endDate,
    this.id = "",
    this.title = "",
    this.description = "",
  });

  factory _$HolidayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HolidayModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @TimestampSerializer()
  DateTime? startDate;
  @override
  @TimestampSerializer()
  DateTime? endDate;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String title;
  @override
  @JsonKey()
  String description;

  @override
  String toString() {
    return 'HolidayModel(createdAt: $createdAt, startDate: $startDate, endDate: $endDate, id: $id, title: $title, description: $description)';
  }

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayModelImplCopyWith<_$HolidayModelImpl> get copyWith =>
      __$$HolidayModelImplCopyWithImpl<_$HolidayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HolidayModelImplToJson(this);
  }
}

abstract class _HolidayModel implements HolidayModel {
  factory _HolidayModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startDate,
    @TimestampSerializer() DateTime? endDate,
    String id,
    String title,
    String description,
  }) = _$HolidayModelImpl;

  factory _HolidayModel.fromJson(Map<String, dynamic> json) =
      _$HolidayModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get startDate;
  @TimestampSerializer()
  set startDate(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get endDate;
  @TimestampSerializer()
  set endDate(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get title;
  set title(String value);
  @override
  String get description;
  set description(String value);

  /// Create a copy of HolidayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HolidayModelImplCopyWith<_$HolidayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
