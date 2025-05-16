// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  set displayName(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String? get deviceToken => throw _privateConstructorUsedError;
  set deviceToken(String? value) => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  set role(String? value) => throw _privateConstructorUsedError;
  String? get languageCode => throw _privateConstructorUsedError;
  set languageCode(String? value) => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  set profilePhoto(String? value) => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  set blocked(bool value) => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  set password(String value) => throw _privateConstructorUsedError;
  String get jobTitle => throw _privateConstructorUsedError;
  set jobTitle(String value) => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  set companyId(String value) => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String displayName,
    String email,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    bool blocked,
    String password,
    String jobTitle,
    String companyId,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? displayName = null,
    Object? email = null,
    Object? deviceToken = freezed,
    Object? role = freezed,
    Object? languageCode = freezed,
    Object? profilePhoto = freezed,
    Object? blocked = null,
    Object? password = null,
    Object? jobTitle = null,
    Object? companyId = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            displayName:
                null == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            deviceToken:
                freezed == deviceToken
                    ? _value.deviceToken
                    : deviceToken // ignore: cast_nullable_to_non_nullable
                        as String?,
            role:
                freezed == role
                    ? _value.role
                    : role // ignore: cast_nullable_to_non_nullable
                        as String?,
            languageCode:
                freezed == languageCode
                    ? _value.languageCode
                    : languageCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            profilePhoto:
                freezed == profilePhoto
                    ? _value.profilePhoto
                    : profilePhoto // ignore: cast_nullable_to_non_nullable
                        as String?,
            blocked:
                null == blocked
                    ? _value.blocked
                    : blocked // ignore: cast_nullable_to_non_nullable
                        as bool,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            jobTitle:
                null == jobTitle
                    ? _value.jobTitle
                    : jobTitle // ignore: cast_nullable_to_non_nullable
                        as String,
            companyId:
                null == companyId
                    ? _value.companyId
                    : companyId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String displayName,
    String email,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    bool blocked,
    String password,
    String jobTitle,
    String companyId,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? displayName = null,
    Object? email = null,
    Object? deviceToken = freezed,
    Object? role = freezed,
    Object? languageCode = freezed,
    Object? profilePhoto = freezed,
    Object? blocked = null,
    Object? password = null,
    Object? jobTitle = null,
    Object? companyId = null,
  }) {
    return _then(
      _$UserModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        displayName:
            null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        deviceToken:
            freezed == deviceToken
                ? _value.deviceToken
                : deviceToken // ignore: cast_nullable_to_non_nullable
                    as String?,
        role:
            freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                    as String?,
        languageCode:
            freezed == languageCode
                ? _value.languageCode
                : languageCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        profilePhoto:
            freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                    as String?,
        blocked:
            null == blocked
                ? _value.blocked
                : blocked // ignore: cast_nullable_to_non_nullable
                    as bool,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        jobTitle:
            null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                    as String,
        companyId:
            null == companyId
                ? _value.companyId
                : companyId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id,
    this.displayName = '',
    this.email = '',
    this.deviceToken,
    this.role,
    this.languageCode,
    this.profilePhoto,
    this.blocked = false,
    this.password = '',
    this.jobTitle = '',
    this.companyId = '',
  });

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  @JsonKey()
  String displayName;
  @override
  @JsonKey()
  String email;
  @override
  String? deviceToken;
  @override
  String? role;
  @override
  String? languageCode;
  @override
  String? profilePhoto;
  @override
  @JsonKey()
  bool blocked;
  @override
  @JsonKey()
  String password;
  @override
  @JsonKey()
  String jobTitle;
  @override
  @JsonKey()
  String companyId;

  @override
  String toString() {
    return 'UserModel(createdAt: $createdAt, id: $id, displayName: $displayName, email: $email, deviceToken: $deviceToken, role: $role, languageCode: $languageCode, profilePhoto: $profilePhoto, blocked: $blocked, password: $password, jobTitle: $jobTitle, companyId: $companyId)';
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String displayName,
    String email,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    bool blocked,
    String password,
    String jobTitle,
    String companyId,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String get displayName;
  set displayName(String value);
  @override
  String get email;
  set email(String value);
  @override
  String? get deviceToken;
  set deviceToken(String? value);
  @override
  String? get role;
  set role(String? value);
  @override
  String? get languageCode;
  set languageCode(String? value);
  @override
  String? get profilePhoto;
  set profilePhoto(String? value);
  @override
  bool get blocked;
  set blocked(bool value);
  @override
  String get password;
  set password(String value);
  @override
  String get jobTitle;
  set jobTitle(String value);
  @override
  String get companyId;
  set companyId(String value);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightUserModel _$LightUserModelFromJson(Map<String, dynamic> json) {
  return _LightUserModel.fromJson(json);
}

/// @nodoc
mixin _$LightUserModel {
  String? get id => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  /// Serializes this LightUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightUserModelCopyWith<LightUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightUserModelCopyWith<$Res> {
  factory $LightUserModelCopyWith(
    LightUserModel value,
    $Res Function(LightUserModel) then,
  ) = _$LightUserModelCopyWithImpl<$Res, LightUserModel>;
  @useResult
  $Res call({String? id, String? displayName});
}

/// @nodoc
class _$LightUserModelCopyWithImpl<$Res, $Val extends LightUserModel>
    implements $LightUserModelCopyWith<$Res> {
  _$LightUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? displayName = freezed}) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            displayName:
                freezed == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LightUserModelImplCopyWith<$Res>
    implements $LightUserModelCopyWith<$Res> {
  factory _$$LightUserModelImplCopyWith(
    _$LightUserModelImpl value,
    $Res Function(_$LightUserModelImpl) then,
  ) = __$$LightUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? displayName});
}

/// @nodoc
class __$$LightUserModelImplCopyWithImpl<$Res>
    extends _$LightUserModelCopyWithImpl<$Res, _$LightUserModelImpl>
    implements _$$LightUserModelImplCopyWith<$Res> {
  __$$LightUserModelImplCopyWithImpl(
    _$LightUserModelImpl _value,
    $Res Function(_$LightUserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LightUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? displayName = freezed}) {
    return _then(
      _$LightUserModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        displayName:
            freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LightUserModelImpl implements _LightUserModel {
  _$LightUserModelImpl({this.id, this.displayName});

  factory _$LightUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightUserModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'LightUserModel(id: $id, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName);

  /// Create a copy of LightUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightUserModelImplCopyWith<_$LightUserModelImpl> get copyWith =>
      __$$LightUserModelImplCopyWithImpl<_$LightUserModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LightUserModelImplToJson(this);
  }
}

abstract class _LightUserModel implements LightUserModel {
  factory _LightUserModel({final String? id, final String? displayName}) =
      _$LightUserModelImpl;

  factory _LightUserModel.fromJson(Map<String, dynamic> json) =
      _$LightUserModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get displayName;

  /// Create a copy of LightUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightUserModelImplCopyWith<_$LightUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
