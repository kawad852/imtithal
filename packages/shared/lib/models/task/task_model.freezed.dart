// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set deliveryDate(DateTime? value) => throw _privateConstructorUsedError;
  String get deliveryTime => throw _privateConstructorUsedError;
  set deliveryTime(String value) => throw _privateConstructorUsedError;
  int get allowedDurationInMinutes => throw _privateConstructorUsedError;
  set allowedDurationInMinutes(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  set companyId(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  String get departmentId => throw _privateConstructorUsedError;
  set departmentId(String value) => throw _privateConstructorUsedError;
  String get penaltyDescription => throw _privateConstructorUsedError;
  set penaltyDescription(String value) => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  set notes(String value) => throw _privateConstructorUsedError;
  String? get repeatType => throw _privateConstructorUsedError;
  set repeatType(String? value) => throw _privateConstructorUsedError;
  bool get markedAsLate => throw _privateConstructorUsedError;
  set markedAsLate(bool value) => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  set attachments(List<String> value) => throw _privateConstructorUsedError;
  List<String> get repeatDays => throw _privateConstructorUsedError;
  set repeatDays(List<String> value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<XFile>? get files => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set files(List<XFile>? value) => throw _privateConstructorUsedError;

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? deliveryDate,
    String deliveryTime,
    int allowedDurationInMinutes,
    String id,
    String companyId,
    String title,
    String description,
    String status,
    String departmentId,
    String penaltyDescription,
    String notes,
    String? repeatType,
    bool markedAsLate,
    List<String> attachments,
    List<String> repeatDays,
    @JsonKey(includeToJson: false, includeFromJson: false) List<XFile>? files,
  });
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryTime = null,
    Object? allowedDurationInMinutes = null,
    Object? id = null,
    Object? companyId = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? departmentId = null,
    Object? penaltyDescription = null,
    Object? notes = null,
    Object? repeatType = freezed,
    Object? markedAsLate = null,
    Object? attachments = null,
    Object? repeatDays = null,
    Object? files = freezed,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            deliveryDate:
                freezed == deliveryDate
                    ? _value.deliveryDate
                    : deliveryDate // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            deliveryTime:
                null == deliveryTime
                    ? _value.deliveryTime
                    : deliveryTime // ignore: cast_nullable_to_non_nullable
                        as String,
            allowedDurationInMinutes:
                null == allowedDurationInMinutes
                    ? _value.allowedDurationInMinutes
                    : allowedDurationInMinutes // ignore: cast_nullable_to_non_nullable
                        as int,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            companyId:
                null == companyId
                    ? _value.companyId
                    : companyId // ignore: cast_nullable_to_non_nullable
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
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            departmentId:
                null == departmentId
                    ? _value.departmentId
                    : departmentId // ignore: cast_nullable_to_non_nullable
                        as String,
            penaltyDescription:
                null == penaltyDescription
                    ? _value.penaltyDescription
                    : penaltyDescription // ignore: cast_nullable_to_non_nullable
                        as String,
            notes:
                null == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String,
            repeatType:
                freezed == repeatType
                    ? _value.repeatType
                    : repeatType // ignore: cast_nullable_to_non_nullable
                        as String?,
            markedAsLate:
                null == markedAsLate
                    ? _value.markedAsLate
                    : markedAsLate // ignore: cast_nullable_to_non_nullable
                        as bool,
            attachments:
                null == attachments
                    ? _value.attachments
                    : attachments // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            repeatDays:
                null == repeatDays
                    ? _value.repeatDays
                    : repeatDays // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            files:
                freezed == files
                    ? _value.files
                    : files // ignore: cast_nullable_to_non_nullable
                        as List<XFile>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
    _$TaskModelImpl value,
    $Res Function(_$TaskModelImpl) then,
  ) = __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? deliveryDate,
    String deliveryTime,
    int allowedDurationInMinutes,
    String id,
    String companyId,
    String title,
    String description,
    String status,
    String departmentId,
    String penaltyDescription,
    String notes,
    String? repeatType,
    bool markedAsLate,
    List<String> attachments,
    List<String> repeatDays,
    @JsonKey(includeToJson: false, includeFromJson: false) List<XFile>? files,
  });
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
    _$TaskModelImpl _value,
    $Res Function(_$TaskModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryTime = null,
    Object? allowedDurationInMinutes = null,
    Object? id = null,
    Object? companyId = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? departmentId = null,
    Object? penaltyDescription = null,
    Object? notes = null,
    Object? repeatType = freezed,
    Object? markedAsLate = null,
    Object? attachments = null,
    Object? repeatDays = null,
    Object? files = freezed,
  }) {
    return _then(
      _$TaskModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        deliveryDate:
            freezed == deliveryDate
                ? _value.deliveryDate
                : deliveryDate // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        deliveryTime:
            null == deliveryTime
                ? _value.deliveryTime
                : deliveryTime // ignore: cast_nullable_to_non_nullable
                    as String,
        allowedDurationInMinutes:
            null == allowedDurationInMinutes
                ? _value.allowedDurationInMinutes
                : allowedDurationInMinutes // ignore: cast_nullable_to_non_nullable
                    as int,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        companyId:
            null == companyId
                ? _value.companyId
                : companyId // ignore: cast_nullable_to_non_nullable
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
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        departmentId:
            null == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                    as String,
        penaltyDescription:
            null == penaltyDescription
                ? _value.penaltyDescription
                : penaltyDescription // ignore: cast_nullable_to_non_nullable
                    as String,
        notes:
            null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String,
        repeatType:
            freezed == repeatType
                ? _value.repeatType
                : repeatType // ignore: cast_nullable_to_non_nullable
                    as String?,
        markedAsLate:
            null == markedAsLate
                ? _value.markedAsLate
                : markedAsLate // ignore: cast_nullable_to_non_nullable
                    as bool,
        attachments:
            null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        repeatDays:
            null == repeatDays
                ? _value.repeatDays
                : repeatDays // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        files:
            freezed == files
                ? _value.files
                : files // ignore: cast_nullable_to_non_nullable
                    as List<XFile>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TaskModelImpl extends _TaskModel {
  _$TaskModelImpl({
    @TimestampSerializer() this.createdAt,
    @TimestampSerializer() this.deliveryDate,
    this.deliveryTime = "",
    this.allowedDurationInMinutes = 0,
    this.id = "",
    required this.companyId,
    this.title = "",
    this.description = "",
    this.status = "",
    this.departmentId = "",
    this.penaltyDescription = "",
    this.notes = "",
    this.repeatType,
    this.markedAsLate = false,
    required this.attachments,
    required this.repeatDays,
    @JsonKey(includeToJson: false, includeFromJson: false) this.files,
  }) : super._();

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @TimestampSerializer()
  DateTime? deliveryDate;
  @override
  @JsonKey()
  String deliveryTime;
  @override
  @JsonKey()
  int allowedDurationInMinutes;
  @override
  @JsonKey()
  String id;
  @override
  String companyId;
  @override
  @JsonKey()
  String title;
  @override
  @JsonKey()
  String description;
  @override
  @JsonKey()
  String status;
  @override
  @JsonKey()
  String departmentId;
  @override
  @JsonKey()
  String penaltyDescription;
  @override
  @JsonKey()
  String notes;
  @override
  String? repeatType;
  @override
  @JsonKey()
  bool markedAsLate;
  @override
  List<String> attachments;
  @override
  List<String> repeatDays;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<XFile>? files;

  @override
  String toString() {
    return 'TaskModel(createdAt: $createdAt, deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, allowedDurationInMinutes: $allowedDurationInMinutes, id: $id, companyId: $companyId, title: $title, description: $description, status: $status, departmentId: $departmentId, penaltyDescription: $penaltyDescription, notes: $notes, repeatType: $repeatType, markedAsLate: $markedAsLate, attachments: $attachments, repeatDays: $repeatDays, files: $files)';
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(this);
  }
}

abstract class _TaskModel extends TaskModel {
  factory _TaskModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? deliveryDate,
    String deliveryTime,
    int allowedDurationInMinutes,
    String id,
    required String companyId,
    String title,
    String description,
    String status,
    String departmentId,
    String penaltyDescription,
    String notes,
    String? repeatType,
    bool markedAsLate,
    required List<String> attachments,
    required List<String> repeatDays,
    @JsonKey(includeToJson: false, includeFromJson: false) List<XFile>? files,
  }) = _$TaskModelImpl;
  _TaskModel._() : super._();

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get deliveryDate;
  @TimestampSerializer()
  set deliveryDate(DateTime? value);
  @override
  String get deliveryTime;
  set deliveryTime(String value);
  @override
  int get allowedDurationInMinutes;
  set allowedDurationInMinutes(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get companyId;
  set companyId(String value);
  @override
  String get title;
  set title(String value);
  @override
  String get description;
  set description(String value);
  @override
  String get status;
  set status(String value);
  @override
  String get departmentId;
  set departmentId(String value);
  @override
  String get penaltyDescription;
  set penaltyDescription(String value);
  @override
  String get notes;
  set notes(String value);
  @override
  String? get repeatType;
  set repeatType(String? value);
  @override
  bool get markedAsLate;
  set markedAsLate(bool value);
  @override
  List<String> get attachments;
  set attachments(List<String> value);
  @override
  List<String> get repeatDays;
  set repeatDays(List<String> value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<XFile>? get files;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set files(List<XFile>? value);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
