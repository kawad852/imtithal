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
  @TimestampSerializer()
  DateTime? get assignedDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set assignedDate(DateTime? value) => throw _privateConstructorUsedError;
  String get deliveryTime => throw _privateConstructorUsedError;
  set deliveryTime(String value) => throw _privateConstructorUsedError;
  int get allowedDurationInMinutes => throw _privateConstructorUsedError;
  set allowedDurationInMinutes(int value) => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  set points(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String? get parentTaskId => throw _privateConstructorUsedError;
  set parentTaskId(String? value) => throw _privateConstructorUsedError;
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
  String get violationDescription => throw _privateConstructorUsedError;
  set violationDescription(String value) => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  set notes(String value) => throw _privateConstructorUsedError;
  String? get repeatType => throw _privateConstructorUsedError;
  set repeatType(String? value) => throw _privateConstructorUsedError;
  bool get markedAsLate => throw _privateConstructorUsedError;
  set markedAsLate(bool value) => throw _privateConstructorUsedError;
  List<AttachmentModel>? get attachments => throw _privateConstructorUsedError;
  set attachments(List<AttachmentModel>? value) =>
      throw _privateConstructorUsedError;
  List<String> get assignedUserIds => throw _privateConstructorUsedError;
  set assignedUserIds(List<String> value) => throw _privateConstructorUsedError;
  List<String> get repeatDays => throw _privateConstructorUsedError;
  set repeatDays(List<String> value) => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  set userId(String? value) => throw _privateConstructorUsedError;
  int get inCompletedTasksCount => throw _privateConstructorUsedError;
  set inCompletedTasksCount(int value) => throw _privateConstructorUsedError;
  int get completedTasksCount => throw _privateConstructorUsedError;
  set completedTasksCount(int value) => throw _privateConstructorUsedError;
  int get lateTasksCount => throw _privateConstructorUsedError;
  set lateTasksCount(int value) => throw _privateConstructorUsedError;
  int get violationTasksCount => throw _privateConstructorUsedError;
  set violationTasksCount(int value) => throw _privateConstructorUsedError;
  int get totalAssignedUsers => throw _privateConstructorUsedError;
  set totalAssignedUsers(int value) => throw _privateConstructorUsedError;
  LightViolationModel? get violation => throw _privateConstructorUsedError;
  set violation(LightViolationModel? value) =>
      throw _privateConstructorUsedError;
  String get createdById => throw _privateConstructorUsedError;
  set createdById(String value) => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  UserModel? get userModel => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set userModel(UserModel? value) => throw _privateConstructorUsedError;

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
    @TimestampSerializer() DateTime? assignedDate,
    String deliveryTime,
    int allowedDurationInMinutes,
    int points,
    String id,
    String? parentTaskId,
    String companyId,
    String title,
    String description,
    String status,
    String departmentId,
    String violationDescription,
    String notes,
    String? repeatType,
    bool markedAsLate,
    List<AttachmentModel>? attachments,
    List<String> assignedUserIds,
    List<String> repeatDays,
    String? userId,
    int inCompletedTasksCount,
    int completedTasksCount,
    int lateTasksCount,
    int violationTasksCount,
    int totalAssignedUsers,
    LightViolationModel? violation,
    String createdById,
    @JsonKey(includeFromJson: false, includeToJson: false) UserModel? userModel,
  });

  $LightViolationModelCopyWith<$Res>? get violation;
  $UserModelCopyWith<$Res>? get userModel;
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
    Object? assignedDate = freezed,
    Object? deliveryTime = null,
    Object? allowedDurationInMinutes = null,
    Object? points = null,
    Object? id = null,
    Object? parentTaskId = freezed,
    Object? companyId = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? departmentId = null,
    Object? violationDescription = null,
    Object? notes = null,
    Object? repeatType = freezed,
    Object? markedAsLate = null,
    Object? attachments = freezed,
    Object? assignedUserIds = null,
    Object? repeatDays = null,
    Object? userId = freezed,
    Object? inCompletedTasksCount = null,
    Object? completedTasksCount = null,
    Object? lateTasksCount = null,
    Object? violationTasksCount = null,
    Object? totalAssignedUsers = null,
    Object? violation = freezed,
    Object? createdById = null,
    Object? userModel = freezed,
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
            assignedDate:
                freezed == assignedDate
                    ? _value.assignedDate
                    : assignedDate // ignore: cast_nullable_to_non_nullable
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
            points:
                null == points
                    ? _value.points
                    : points // ignore: cast_nullable_to_non_nullable
                        as int,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            parentTaskId:
                freezed == parentTaskId
                    ? _value.parentTaskId
                    : parentTaskId // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            violationDescription:
                null == violationDescription
                    ? _value.violationDescription
                    : violationDescription // ignore: cast_nullable_to_non_nullable
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
                freezed == attachments
                    ? _value.attachments
                    : attachments // ignore: cast_nullable_to_non_nullable
                        as List<AttachmentModel>?,
            assignedUserIds:
                null == assignedUserIds
                    ? _value.assignedUserIds
                    : assignedUserIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            repeatDays:
                null == repeatDays
                    ? _value.repeatDays
                    : repeatDays // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            userId:
                freezed == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String?,
            inCompletedTasksCount:
                null == inCompletedTasksCount
                    ? _value.inCompletedTasksCount
                    : inCompletedTasksCount // ignore: cast_nullable_to_non_nullable
                        as int,
            completedTasksCount:
                null == completedTasksCount
                    ? _value.completedTasksCount
                    : completedTasksCount // ignore: cast_nullable_to_non_nullable
                        as int,
            lateTasksCount:
                null == lateTasksCount
                    ? _value.lateTasksCount
                    : lateTasksCount // ignore: cast_nullable_to_non_nullable
                        as int,
            violationTasksCount:
                null == violationTasksCount
                    ? _value.violationTasksCount
                    : violationTasksCount // ignore: cast_nullable_to_non_nullable
                        as int,
            totalAssignedUsers:
                null == totalAssignedUsers
                    ? _value.totalAssignedUsers
                    : totalAssignedUsers // ignore: cast_nullable_to_non_nullable
                        as int,
            violation:
                freezed == violation
                    ? _value.violation
                    : violation // ignore: cast_nullable_to_non_nullable
                        as LightViolationModel?,
            createdById:
                null == createdById
                    ? _value.createdById
                    : createdById // ignore: cast_nullable_to_non_nullable
                        as String,
            userModel:
                freezed == userModel
                    ? _value.userModel
                    : userModel // ignore: cast_nullable_to_non_nullable
                        as UserModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightViolationModelCopyWith<$Res>? get violation {
    if (_value.violation == null) {
      return null;
    }

    return $LightViolationModelCopyWith<$Res>(_value.violation!, (value) {
      return _then(_value.copyWith(violation: value) as $Val);
    });
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userModel {
    if (_value.userModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userModel!, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
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
    @TimestampSerializer() DateTime? assignedDate,
    String deliveryTime,
    int allowedDurationInMinutes,
    int points,
    String id,
    String? parentTaskId,
    String companyId,
    String title,
    String description,
    String status,
    String departmentId,
    String violationDescription,
    String notes,
    String? repeatType,
    bool markedAsLate,
    List<AttachmentModel>? attachments,
    List<String> assignedUserIds,
    List<String> repeatDays,
    String? userId,
    int inCompletedTasksCount,
    int completedTasksCount,
    int lateTasksCount,
    int violationTasksCount,
    int totalAssignedUsers,
    LightViolationModel? violation,
    String createdById,
    @JsonKey(includeFromJson: false, includeToJson: false) UserModel? userModel,
  });

  @override
  $LightViolationModelCopyWith<$Res>? get violation;
  @override
  $UserModelCopyWith<$Res>? get userModel;
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
    Object? assignedDate = freezed,
    Object? deliveryTime = null,
    Object? allowedDurationInMinutes = null,
    Object? points = null,
    Object? id = null,
    Object? parentTaskId = freezed,
    Object? companyId = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? departmentId = null,
    Object? violationDescription = null,
    Object? notes = null,
    Object? repeatType = freezed,
    Object? markedAsLate = null,
    Object? attachments = freezed,
    Object? assignedUserIds = null,
    Object? repeatDays = null,
    Object? userId = freezed,
    Object? inCompletedTasksCount = null,
    Object? completedTasksCount = null,
    Object? lateTasksCount = null,
    Object? violationTasksCount = null,
    Object? totalAssignedUsers = null,
    Object? violation = freezed,
    Object? createdById = null,
    Object? userModel = freezed,
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
        assignedDate:
            freezed == assignedDate
                ? _value.assignedDate
                : assignedDate // ignore: cast_nullable_to_non_nullable
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
        points:
            null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                    as int,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        parentTaskId:
            freezed == parentTaskId
                ? _value.parentTaskId
                : parentTaskId // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        violationDescription:
            null == violationDescription
                ? _value.violationDescription
                : violationDescription // ignore: cast_nullable_to_non_nullable
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
            freezed == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                    as List<AttachmentModel>?,
        assignedUserIds:
            null == assignedUserIds
                ? _value.assignedUserIds
                : assignedUserIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        repeatDays:
            null == repeatDays
                ? _value.repeatDays
                : repeatDays // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        userId:
            freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String?,
        inCompletedTasksCount:
            null == inCompletedTasksCount
                ? _value.inCompletedTasksCount
                : inCompletedTasksCount // ignore: cast_nullable_to_non_nullable
                    as int,
        completedTasksCount:
            null == completedTasksCount
                ? _value.completedTasksCount
                : completedTasksCount // ignore: cast_nullable_to_non_nullable
                    as int,
        lateTasksCount:
            null == lateTasksCount
                ? _value.lateTasksCount
                : lateTasksCount // ignore: cast_nullable_to_non_nullable
                    as int,
        violationTasksCount:
            null == violationTasksCount
                ? _value.violationTasksCount
                : violationTasksCount // ignore: cast_nullable_to_non_nullable
                    as int,
        totalAssignedUsers:
            null == totalAssignedUsers
                ? _value.totalAssignedUsers
                : totalAssignedUsers // ignore: cast_nullable_to_non_nullable
                    as int,
        violation:
            freezed == violation
                ? _value.violation
                : violation // ignore: cast_nullable_to_non_nullable
                    as LightViolationModel?,
        createdById:
            null == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                    as String,
        userModel:
            freezed == userModel
                ? _value.userModel
                : userModel // ignore: cast_nullable_to_non_nullable
                    as UserModel?,
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
    @TimestampSerializer() this.assignedDate,
    this.deliveryTime = "",
    this.allowedDurationInMinutes = 0,
    this.points = 0,
    this.id = "",
    this.parentTaskId,
    required this.companyId,
    this.title = "",
    this.description = "",
    this.status = "",
    this.departmentId = "",
    this.violationDescription = "",
    this.notes = "",
    this.repeatType,
    this.markedAsLate = false,
    this.attachments,
    this.assignedUserIds = const [],
    required this.repeatDays,
    this.userId,
    this.inCompletedTasksCount = 0,
    this.completedTasksCount = 0,
    this.lateTasksCount = 0,
    this.violationTasksCount = 0,
    this.totalAssignedUsers = 0,
    this.violation,
    required this.createdById,
    @JsonKey(includeFromJson: false, includeToJson: false) this.userModel,
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
  @TimestampSerializer()
  DateTime? assignedDate;
  @override
  @JsonKey()
  String deliveryTime;
  @override
  @JsonKey()
  int allowedDurationInMinutes;
  @override
  @JsonKey()
  int points;
  @override
  @JsonKey()
  String id;
  @override
  String? parentTaskId;
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
  String violationDescription;
  @override
  @JsonKey()
  String notes;
  @override
  String? repeatType;
  @override
  @JsonKey()
  bool markedAsLate;
  @override
  List<AttachmentModel>? attachments;
  @override
  @JsonKey()
  List<String> assignedUserIds;
  @override
  List<String> repeatDays;
  @override
  String? userId;
  @override
  @JsonKey()
  int inCompletedTasksCount;
  @override
  @JsonKey()
  int completedTasksCount;
  @override
  @JsonKey()
  int lateTasksCount;
  @override
  @JsonKey()
  int violationTasksCount;
  @override
  @JsonKey()
  int totalAssignedUsers;
  @override
  LightViolationModel? violation;
  @override
  String createdById;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  UserModel? userModel;

  @override
  String toString() {
    return 'TaskModel(createdAt: $createdAt, deliveryDate: $deliveryDate, assignedDate: $assignedDate, deliveryTime: $deliveryTime, allowedDurationInMinutes: $allowedDurationInMinutes, points: $points, id: $id, parentTaskId: $parentTaskId, companyId: $companyId, title: $title, description: $description, status: $status, departmentId: $departmentId, violationDescription: $violationDescription, notes: $notes, repeatType: $repeatType, markedAsLate: $markedAsLate, attachments: $attachments, assignedUserIds: $assignedUserIds, repeatDays: $repeatDays, userId: $userId, inCompletedTasksCount: $inCompletedTasksCount, completedTasksCount: $completedTasksCount, lateTasksCount: $lateTasksCount, violationTasksCount: $violationTasksCount, totalAssignedUsers: $totalAssignedUsers, violation: $violation, createdById: $createdById, userModel: $userModel)';
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
    @TimestampSerializer() DateTime? assignedDate,
    String deliveryTime,
    int allowedDurationInMinutes,
    int points,
    String id,
    String? parentTaskId,
    required String companyId,
    String title,
    String description,
    String status,
    String departmentId,
    String violationDescription,
    String notes,
    String? repeatType,
    bool markedAsLate,
    List<AttachmentModel>? attachments,
    List<String> assignedUserIds,
    required List<String> repeatDays,
    String? userId,
    int inCompletedTasksCount,
    int completedTasksCount,
    int lateTasksCount,
    int violationTasksCount,
    int totalAssignedUsers,
    LightViolationModel? violation,
    required String createdById,
    @JsonKey(includeFromJson: false, includeToJson: false) UserModel? userModel,
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
  @TimestampSerializer()
  DateTime? get assignedDate;
  @TimestampSerializer()
  set assignedDate(DateTime? value);
  @override
  String get deliveryTime;
  set deliveryTime(String value);
  @override
  int get allowedDurationInMinutes;
  set allowedDurationInMinutes(int value);
  @override
  int get points;
  set points(int value);
  @override
  String get id;
  set id(String value);
  @override
  String? get parentTaskId;
  set parentTaskId(String? value);
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
  String get violationDescription;
  set violationDescription(String value);
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
  List<AttachmentModel>? get attachments;
  set attachments(List<AttachmentModel>? value);
  @override
  List<String> get assignedUserIds;
  set assignedUserIds(List<String> value);
  @override
  List<String> get repeatDays;
  set repeatDays(List<String> value);
  @override
  String? get userId;
  set userId(String? value);
  @override
  int get inCompletedTasksCount;
  set inCompletedTasksCount(int value);
  @override
  int get completedTasksCount;
  set completedTasksCount(int value);
  @override
  int get lateTasksCount;
  set lateTasksCount(int value);
  @override
  int get violationTasksCount;
  set violationTasksCount(int value);
  @override
  int get totalAssignedUsers;
  set totalAssignedUsers(int value);
  @override
  LightViolationModel? get violation;
  set violation(LightViolationModel? value);
  @override
  String get createdById;
  set createdById(String value);
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  UserModel? get userModel;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set userModel(UserModel? value);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
