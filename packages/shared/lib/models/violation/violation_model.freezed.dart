// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ViolationModel _$ViolationModelFromJson(Map<String, dynamic> json) {
  return _ViolationModel.fromJson(json);
}

/// @nodoc
mixin _$ViolationModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  set notes(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;
  set taskId(String? value) => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  set companyId(String value) => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  set userId(String? value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  String get createdById => throw _privateConstructorUsedError;
  set createdById(String value) => throw _privateConstructorUsedError;
  List<AttachmentModel>? get attachments => throw _privateConstructorUsedError;
  set attachments(List<AttachmentModel>? value) =>
      throw _privateConstructorUsedError;
  ViolationReplyModel? get lastReply => throw _privateConstructorUsedError;
  set lastReply(ViolationReplyModel? value) =>
      throw _privateConstructorUsedError;
  String? get userDisplayName => throw _privateConstructorUsedError;
  set userDisplayName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  UserModel? get userModel => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set userModel(UserModel? value) => throw _privateConstructorUsedError;

  /// Serializes this ViolationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationModelCopyWith<ViolationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationModelCopyWith<$Res> {
  factory $ViolationModelCopyWith(
    ViolationModel value,
    $Res Function(ViolationModel) then,
  ) = _$ViolationModelCopyWithImpl<$Res, ViolationModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    String notes,
    String description,
    String? taskId,
    String companyId,
    String? userId,
    String status,
    String createdById,
    List<AttachmentModel>? attachments,
    ViolationReplyModel? lastReply,
    String? userDisplayName,
    @JsonKey(includeToJson: false, includeFromJson: false) UserModel? userModel,
  });

  $ViolationReplyModelCopyWith<$Res>? get lastReply;
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$ViolationModelCopyWithImpl<$Res, $Val extends ViolationModel>
    implements $ViolationModelCopyWith<$Res> {
  _$ViolationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? type = null,
    Object? notes = null,
    Object? description = null,
    Object? taskId = freezed,
    Object? companyId = null,
    Object? userId = freezed,
    Object? status = null,
    Object? createdById = null,
    Object? attachments = freezed,
    Object? lastReply = freezed,
    Object? userDisplayName = freezed,
    Object? userModel = freezed,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
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
            notes:
                null == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            taskId:
                freezed == taskId
                    ? _value.taskId
                    : taskId // ignore: cast_nullable_to_non_nullable
                        as String?,
            companyId:
                null == companyId
                    ? _value.companyId
                    : companyId // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                freezed == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            createdById:
                null == createdById
                    ? _value.createdById
                    : createdById // ignore: cast_nullable_to_non_nullable
                        as String,
            attachments:
                freezed == attachments
                    ? _value.attachments
                    : attachments // ignore: cast_nullable_to_non_nullable
                        as List<AttachmentModel>?,
            lastReply:
                freezed == lastReply
                    ? _value.lastReply
                    : lastReply // ignore: cast_nullable_to_non_nullable
                        as ViolationReplyModel?,
            userDisplayName:
                freezed == userDisplayName
                    ? _value.userDisplayName
                    : userDisplayName // ignore: cast_nullable_to_non_nullable
                        as String?,
            userModel:
                freezed == userModel
                    ? _value.userModel
                    : userModel // ignore: cast_nullable_to_non_nullable
                        as UserModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViolationReplyModelCopyWith<$Res>? get lastReply {
    if (_value.lastReply == null) {
      return null;
    }

    return $ViolationReplyModelCopyWith<$Res>(_value.lastReply!, (value) {
      return _then(_value.copyWith(lastReply: value) as $Val);
    });
  }

  /// Create a copy of ViolationModel
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
abstract class _$$ViolationModelImplCopyWith<$Res>
    implements $ViolationModelCopyWith<$Res> {
  factory _$$ViolationModelImplCopyWith(
    _$ViolationModelImpl value,
    $Res Function(_$ViolationModelImpl) then,
  ) = __$$ViolationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    String notes,
    String description,
    String? taskId,
    String companyId,
    String? userId,
    String status,
    String createdById,
    List<AttachmentModel>? attachments,
    ViolationReplyModel? lastReply,
    String? userDisplayName,
    @JsonKey(includeToJson: false, includeFromJson: false) UserModel? userModel,
  });

  @override
  $ViolationReplyModelCopyWith<$Res>? get lastReply;
  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$ViolationModelImplCopyWithImpl<$Res>
    extends _$ViolationModelCopyWithImpl<$Res, _$ViolationModelImpl>
    implements _$$ViolationModelImplCopyWith<$Res> {
  __$$ViolationModelImplCopyWithImpl(
    _$ViolationModelImpl _value,
    $Res Function(_$ViolationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? type = null,
    Object? notes = null,
    Object? description = null,
    Object? taskId = freezed,
    Object? companyId = null,
    Object? userId = freezed,
    Object? status = null,
    Object? createdById = null,
    Object? attachments = freezed,
    Object? lastReply = freezed,
    Object? userDisplayName = freezed,
    Object? userModel = freezed,
  }) {
    return _then(
      _$ViolationModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
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
        notes:
            null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        taskId:
            freezed == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                    as String?,
        companyId:
            null == companyId
                ? _value.companyId
                : companyId // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        createdById:
            null == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                    as String,
        attachments:
            freezed == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                    as List<AttachmentModel>?,
        lastReply:
            freezed == lastReply
                ? _value.lastReply
                : lastReply // ignore: cast_nullable_to_non_nullable
                    as ViolationReplyModel?,
        userDisplayName:
            freezed == userDisplayName
                ? _value.userDisplayName
                : userDisplayName // ignore: cast_nullable_to_non_nullable
                    as String?,
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
class _$ViolationModelImpl implements _ViolationModel {
  _$ViolationModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.type = '',
    this.notes = '',
    this.description = '',
    this.taskId,
    this.companyId = '',
    this.userId,
    this.status = ViolationStatus.defaultValue,
    required this.createdById,
    this.attachments,
    this.lastReply,
    this.userDisplayName,
    @JsonKey(includeToJson: false, includeFromJson: false) this.userModel,
  });

  factory _$ViolationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String type;
  @override
  @JsonKey()
  String notes;
  @override
  @JsonKey()
  String description;
  @override
  String? taskId;
  @override
  @JsonKey()
  String companyId;
  @override
  String? userId;
  @override
  @JsonKey()
  String status;
  @override
  String createdById;
  @override
  List<AttachmentModel>? attachments;
  @override
  ViolationReplyModel? lastReply;
  @override
  String? userDisplayName;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  UserModel? userModel;

  @override
  String toString() {
    return 'ViolationModel(createdAt: $createdAt, id: $id, type: $type, notes: $notes, description: $description, taskId: $taskId, companyId: $companyId, userId: $userId, status: $status, createdById: $createdById, attachments: $attachments, lastReply: $lastReply, userDisplayName: $userDisplayName, userModel: $userModel)';
  }

  /// Create a copy of ViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationModelImplCopyWith<_$ViolationModelImpl> get copyWith =>
      __$$ViolationModelImplCopyWithImpl<_$ViolationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationModelImplToJson(this);
  }
}

abstract class _ViolationModel implements ViolationModel {
  factory _ViolationModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    String notes,
    String description,
    String? taskId,
    String companyId,
    String? userId,
    String status,
    required String createdById,
    List<AttachmentModel>? attachments,
    ViolationReplyModel? lastReply,
    String? userDisplayName,
    @JsonKey(includeToJson: false, includeFromJson: false) UserModel? userModel,
  }) = _$ViolationModelImpl;

  factory _ViolationModel.fromJson(Map<String, dynamic> json) =
      _$ViolationModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get type;
  set type(String value);
  @override
  String get notes;
  set notes(String value);
  @override
  String get description;
  set description(String value);
  @override
  String? get taskId;
  set taskId(String? value);
  @override
  String get companyId;
  set companyId(String value);
  @override
  String? get userId;
  set userId(String? value);
  @override
  String get status;
  set status(String value);
  @override
  String get createdById;
  set createdById(String value);
  @override
  List<AttachmentModel>? get attachments;
  set attachments(List<AttachmentModel>? value);
  @override
  ViolationReplyModel? get lastReply;
  set lastReply(ViolationReplyModel? value);
  @override
  String? get userDisplayName;
  set userDisplayName(String? value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  UserModel? get userModel;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set userModel(UserModel? value);

  /// Create a copy of ViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationModelImplCopyWith<_$ViolationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightViolationModel _$LightViolationModelFromJson(Map<String, dynamic> json) {
  return _LightViolationModel.fromJson(json);
}

/// @nodoc
mixin _$LightViolationModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;

  /// Serializes this LightViolationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightViolationModelCopyWith<LightViolationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightViolationModelCopyWith<$Res> {
  factory $LightViolationModelCopyWith(
    LightViolationModel value,
    $Res Function(LightViolationModel) then,
  ) = _$LightViolationModelCopyWithImpl<$Res, LightViolationModel>;
  @useResult
  $Res call({String id, String type, String status});
}

/// @nodoc
class _$LightViolationModelCopyWithImpl<$Res, $Val extends LightViolationModel>
    implements $LightViolationModelCopyWith<$Res> {
  _$LightViolationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? type = null, Object? status = null}) {
    return _then(
      _value.copyWith(
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
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LightViolationModelImplCopyWith<$Res>
    implements $LightViolationModelCopyWith<$Res> {
  factory _$$LightViolationModelImplCopyWith(
    _$LightViolationModelImpl value,
    $Res Function(_$LightViolationModelImpl) then,
  ) = __$$LightViolationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String status});
}

/// @nodoc
class __$$LightViolationModelImplCopyWithImpl<$Res>
    extends _$LightViolationModelCopyWithImpl<$Res, _$LightViolationModelImpl>
    implements _$$LightViolationModelImplCopyWith<$Res> {
  __$$LightViolationModelImplCopyWithImpl(
    _$LightViolationModelImpl _value,
    $Res Function(_$LightViolationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LightViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? type = null, Object? status = null}) {
    return _then(
      _$LightViolationModelImpl(
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
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LightViolationModelImpl implements _LightViolationModel {
  _$LightViolationModelImpl({
    this.id = '',
    this.type = '',
    this.status = ViolationStatus.defaultValue,
  });

  factory _$LightViolationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightViolationModelImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String type;
  @override
  @JsonKey()
  String status;

  @override
  String toString() {
    return 'LightViolationModel(id: $id, type: $type, status: $status)';
  }

  /// Create a copy of LightViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightViolationModelImplCopyWith<_$LightViolationModelImpl> get copyWith =>
      __$$LightViolationModelImplCopyWithImpl<_$LightViolationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LightViolationModelImplToJson(this);
  }
}

abstract class _LightViolationModel implements LightViolationModel {
  factory _LightViolationModel({String id, String type, String status}) =
      _$LightViolationModelImpl;

  factory _LightViolationModel.fromJson(Map<String, dynamic> json) =
      _$LightViolationModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get type;
  set type(String value);
  @override
  String get status;
  set status(String value);

  /// Create a copy of LightViolationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightViolationModelImplCopyWith<_$LightViolationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ViolationReplyModel _$ViolationReplyModelFromJson(Map<String, dynamic> json) {
  return _ViolationReplyModel.fromJson(json);
}

/// @nodoc
mixin _$ViolationReplyModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  set comment(String value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  List<AttachmentModel>? get attachments => throw _privateConstructorUsedError;
  set attachments(List<AttachmentModel>? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  UserModel? get userModel => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set userModel(UserModel? value) => throw _privateConstructorUsedError;

  /// Serializes this ViolationReplyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationReplyModelCopyWith<ViolationReplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationReplyModelCopyWith<$Res> {
  factory $ViolationReplyModelCopyWith(
    ViolationReplyModel value,
    $Res Function(ViolationReplyModel) then,
  ) = _$ViolationReplyModelCopyWithImpl<$Res, ViolationReplyModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String comment,
    String userId,
    String status,
    List<AttachmentModel>? attachments,
    @JsonKey(includeToJson: false, includeFromJson: false) UserModel? userModel,
  });

  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$ViolationReplyModelCopyWithImpl<$Res, $Val extends ViolationReplyModel>
    implements $ViolationReplyModelCopyWith<$Res> {
  _$ViolationReplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? comment = null,
    Object? userId = null,
    Object? status = null,
    Object? attachments = freezed,
    Object? userModel = freezed,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            comment:
                null == comment
                    ? _value.comment
                    : comment // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            attachments:
                freezed == attachments
                    ? _value.attachments
                    : attachments // ignore: cast_nullable_to_non_nullable
                        as List<AttachmentModel>?,
            userModel:
                freezed == userModel
                    ? _value.userModel
                    : userModel // ignore: cast_nullable_to_non_nullable
                        as UserModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ViolationReplyModel
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
abstract class _$$ViolationReplyModelImplCopyWith<$Res>
    implements $ViolationReplyModelCopyWith<$Res> {
  factory _$$ViolationReplyModelImplCopyWith(
    _$ViolationReplyModelImpl value,
    $Res Function(_$ViolationReplyModelImpl) then,
  ) = __$$ViolationReplyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String comment,
    String userId,
    String status,
    List<AttachmentModel>? attachments,
    @JsonKey(includeToJson: false, includeFromJson: false) UserModel? userModel,
  });

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$ViolationReplyModelImplCopyWithImpl<$Res>
    extends _$ViolationReplyModelCopyWithImpl<$Res, _$ViolationReplyModelImpl>
    implements _$$ViolationReplyModelImplCopyWith<$Res> {
  __$$ViolationReplyModelImplCopyWithImpl(
    _$ViolationReplyModelImpl _value,
    $Res Function(_$ViolationReplyModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ViolationReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? comment = null,
    Object? userId = null,
    Object? status = null,
    Object? attachments = freezed,
    Object? userModel = freezed,
  }) {
    return _then(
      _$ViolationReplyModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        comment:
            null == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        attachments:
            freezed == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                    as List<AttachmentModel>?,
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
class _$ViolationReplyModelImpl implements _ViolationReplyModel {
  _$ViolationReplyModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.comment = '',
    this.userId = '',
    this.status = ViolationStatus.defaultValue,
    this.attachments,
    @JsonKey(includeToJson: false, includeFromJson: false) this.userModel,
  });

  factory _$ViolationReplyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationReplyModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String comment;
  @override
  @JsonKey()
  String userId;
  @override
  @JsonKey()
  String status;
  @override
  List<AttachmentModel>? attachments;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  UserModel? userModel;

  @override
  String toString() {
    return 'ViolationReplyModel(createdAt: $createdAt, id: $id, comment: $comment, userId: $userId, status: $status, attachments: $attachments, userModel: $userModel)';
  }

  /// Create a copy of ViolationReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationReplyModelImplCopyWith<_$ViolationReplyModelImpl> get copyWith =>
      __$$ViolationReplyModelImplCopyWithImpl<_$ViolationReplyModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationReplyModelImplToJson(this);
  }
}

abstract class _ViolationReplyModel implements ViolationReplyModel {
  factory _ViolationReplyModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String comment,
    String userId,
    String status,
    List<AttachmentModel>? attachments,
    @JsonKey(includeToJson: false, includeFromJson: false) UserModel? userModel,
  }) = _$ViolationReplyModelImpl;

  factory _ViolationReplyModel.fromJson(Map<String, dynamic> json) =
      _$ViolationReplyModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get comment;
  set comment(String value);
  @override
  String get userId;
  set userId(String value);
  @override
  String get status;
  set status(String value);
  @override
  List<AttachmentModel>? get attachments;
  set attachments(List<AttachmentModel>? value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  UserModel? get userModel;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set userModel(UserModel? value);

  /// Create a copy of ViolationReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationReplyModelImplCopyWith<_$ViolationReplyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
