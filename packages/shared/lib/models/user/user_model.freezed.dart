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
  @TimestampSerializer()
  DateTime? get workStartDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set workStartDate(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  set displayName(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  set username(String value) => throw _privateConstructorUsedError;
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
  double get salary => throw _privateConstructorUsedError;
  set salary(double value) => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  set password(String value) => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  set address(String value) => throw _privateConstructorUsedError;
  String get jobTitle => throw _privateConstructorUsedError;
  set jobTitle(String value) => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  set companyId(String value) => throw _privateConstructorUsedError;
  String? get departmentId => throw _privateConstructorUsedError;
  set departmentId(String? value) => throw _privateConstructorUsedError;
  List<String> get taskIds => throw _privateConstructorUsedError;
  set taskIds(List<String> value) => throw _privateConstructorUsedError;
  int get inCompletedTasksCount => throw _privateConstructorUsedError;
  set inCompletedTasksCount(int value) => throw _privateConstructorUsedError;
  int get completedTasksCount => throw _privateConstructorUsedError;
  set completedTasksCount(int value) => throw _privateConstructorUsedError;
  int get lateTasksCount => throw _privateConstructorUsedError;
  set lateTasksCount(int value) => throw _privateConstructorUsedError;
  int get penaltyTasksCount => throw _privateConstructorUsedError;
  set penaltyTasksCount(int value) => throw _privateConstructorUsedError;
  String get createdById => throw _privateConstructorUsedError;
  set createdById(String value) => throw _privateConstructorUsedError;
  String? get phoneCountryCode => throw _privateConstructorUsedError;
  set phoneCountryCode(String? value) => throw _privateConstructorUsedError;
  String? get phoneNum => throw _privateConstructorUsedError;
  set phoneNum(String? value) => throw _privateConstructorUsedError;
  String get nationalNumber => throw _privateConstructorUsedError;
  set nationalNumber(String value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get selected => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set selected(bool value) => throw _privateConstructorUsedError;

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
    @TimestampSerializer() DateTime? workStartDate,
    String? id,
    String displayName,
    String email,
    String username,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    bool blocked,
    double salary,
    String password,
    String address,
    String jobTitle,
    String companyId,
    String? departmentId,
    List<String> taskIds,
    int inCompletedTasksCount,
    int completedTasksCount,
    int lateTasksCount,
    int penaltyTasksCount,
    String createdById,
    String? phoneCountryCode,
    String? phoneNum,
    String nationalNumber,
    @JsonKey(includeToJson: false, includeFromJson: false) bool selected,
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
    Object? workStartDate = freezed,
    Object? id = freezed,
    Object? displayName = null,
    Object? email = null,
    Object? username = null,
    Object? deviceToken = freezed,
    Object? role = freezed,
    Object? languageCode = freezed,
    Object? profilePhoto = freezed,
    Object? blocked = null,
    Object? salary = null,
    Object? password = null,
    Object? address = null,
    Object? jobTitle = null,
    Object? companyId = null,
    Object? departmentId = freezed,
    Object? taskIds = null,
    Object? inCompletedTasksCount = null,
    Object? completedTasksCount = null,
    Object? lateTasksCount = null,
    Object? penaltyTasksCount = null,
    Object? createdById = null,
    Object? phoneCountryCode = freezed,
    Object? phoneNum = freezed,
    Object? nationalNumber = null,
    Object? selected = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            workStartDate:
                freezed == workStartDate
                    ? _value.workStartDate
                    : workStartDate // ignore: cast_nullable_to_non_nullable
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
            username:
                null == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
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
            salary:
                null == salary
                    ? _value.salary
                    : salary // ignore: cast_nullable_to_non_nullable
                        as double,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
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
            departmentId:
                freezed == departmentId
                    ? _value.departmentId
                    : departmentId // ignore: cast_nullable_to_non_nullable
                        as String?,
            taskIds:
                null == taskIds
                    ? _value.taskIds
                    : taskIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
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
            penaltyTasksCount:
                null == penaltyTasksCount
                    ? _value.penaltyTasksCount
                    : penaltyTasksCount // ignore: cast_nullable_to_non_nullable
                        as int,
            createdById:
                null == createdById
                    ? _value.createdById
                    : createdById // ignore: cast_nullable_to_non_nullable
                        as String,
            phoneCountryCode:
                freezed == phoneCountryCode
                    ? _value.phoneCountryCode
                    : phoneCountryCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            phoneNum:
                freezed == phoneNum
                    ? _value.phoneNum
                    : phoneNum // ignore: cast_nullable_to_non_nullable
                        as String?,
            nationalNumber:
                null == nationalNumber
                    ? _value.nationalNumber
                    : nationalNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            selected:
                null == selected
                    ? _value.selected
                    : selected // ignore: cast_nullable_to_non_nullable
                        as bool,
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
    @TimestampSerializer() DateTime? workStartDate,
    String? id,
    String displayName,
    String email,
    String username,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    bool blocked,
    double salary,
    String password,
    String address,
    String jobTitle,
    String companyId,
    String? departmentId,
    List<String> taskIds,
    int inCompletedTasksCount,
    int completedTasksCount,
    int lateTasksCount,
    int penaltyTasksCount,
    String createdById,
    String? phoneCountryCode,
    String? phoneNum,
    String nationalNumber,
    @JsonKey(includeToJson: false, includeFromJson: false) bool selected,
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
    Object? workStartDate = freezed,
    Object? id = freezed,
    Object? displayName = null,
    Object? email = null,
    Object? username = null,
    Object? deviceToken = freezed,
    Object? role = freezed,
    Object? languageCode = freezed,
    Object? profilePhoto = freezed,
    Object? blocked = null,
    Object? salary = null,
    Object? password = null,
    Object? address = null,
    Object? jobTitle = null,
    Object? companyId = null,
    Object? departmentId = freezed,
    Object? taskIds = null,
    Object? inCompletedTasksCount = null,
    Object? completedTasksCount = null,
    Object? lateTasksCount = null,
    Object? penaltyTasksCount = null,
    Object? createdById = null,
    Object? phoneCountryCode = freezed,
    Object? phoneNum = freezed,
    Object? nationalNumber = null,
    Object? selected = null,
  }) {
    return _then(
      _$UserModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        workStartDate:
            freezed == workStartDate
                ? _value.workStartDate
                : workStartDate // ignore: cast_nullable_to_non_nullable
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
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
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
        salary:
            null == salary
                ? _value.salary
                : salary // ignore: cast_nullable_to_non_nullable
                    as double,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
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
        departmentId:
            freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                    as String?,
        taskIds:
            null == taskIds
                ? _value.taskIds
                : taskIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
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
        penaltyTasksCount:
            null == penaltyTasksCount
                ? _value.penaltyTasksCount
                : penaltyTasksCount // ignore: cast_nullable_to_non_nullable
                    as int,
        createdById:
            null == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                    as String,
        phoneCountryCode:
            freezed == phoneCountryCode
                ? _value.phoneCountryCode
                : phoneCountryCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        phoneNum:
            freezed == phoneNum
                ? _value.phoneNum
                : phoneNum // ignore: cast_nullable_to_non_nullable
                    as String?,
        nationalNumber:
            null == nationalNumber
                ? _value.nationalNumber
                : nationalNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        selected:
            null == selected
                ? _value.selected
                : selected // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl({
    @TimestampSerializer() this.createdAt,
    @TimestampSerializer() this.workStartDate,
    this.id,
    this.displayName = '',
    this.email = '',
    this.username = '',
    this.deviceToken,
    this.role,
    this.languageCode,
    this.profilePhoto,
    this.blocked = false,
    this.salary = 0.0,
    this.password = '',
    this.address = '',
    this.jobTitle = '',
    this.companyId = '',
    this.departmentId,
    this.taskIds = const [],
    this.inCompletedTasksCount = 0,
    this.completedTasksCount = 0,
    this.lateTasksCount = 0,
    this.penaltyTasksCount = 0,
    required this.createdById,
    this.phoneCountryCode,
    this.phoneNum,
    this.nationalNumber = '',
    @JsonKey(includeToJson: false, includeFromJson: false)
    this.selected = false,
  });

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @TimestampSerializer()
  DateTime? workStartDate;
  @override
  String? id;
  @override
  @JsonKey()
  String displayName;
  @override
  @JsonKey()
  String email;
  @override
  @JsonKey()
  String username;
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
  double salary;
  @override
  @JsonKey()
  String password;
  @override
  @JsonKey()
  String address;
  @override
  @JsonKey()
  String jobTitle;
  @override
  @JsonKey()
  String companyId;
  @override
  String? departmentId;
  @override
  @JsonKey()
  List<String> taskIds;
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
  int penaltyTasksCount;
  @override
  String createdById;
  @override
  String? phoneCountryCode;
  @override
  String? phoneNum;
  @override
  @JsonKey()
  String nationalNumber;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool selected;

  @override
  String toString() {
    return 'UserModel(createdAt: $createdAt, workStartDate: $workStartDate, id: $id, displayName: $displayName, email: $email, username: $username, deviceToken: $deviceToken, role: $role, languageCode: $languageCode, profilePhoto: $profilePhoto, blocked: $blocked, salary: $salary, password: $password, address: $address, jobTitle: $jobTitle, companyId: $companyId, departmentId: $departmentId, taskIds: $taskIds, inCompletedTasksCount: $inCompletedTasksCount, completedTasksCount: $completedTasksCount, lateTasksCount: $lateTasksCount, penaltyTasksCount: $penaltyTasksCount, createdById: $createdById, phoneCountryCode: $phoneCountryCode, phoneNum: $phoneNum, nationalNumber: $nationalNumber, selected: $selected)';
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
    @TimestampSerializer() DateTime? workStartDate,
    String? id,
    String displayName,
    String email,
    String username,
    String? deviceToken,
    String? role,
    String? languageCode,
    String? profilePhoto,
    bool blocked,
    double salary,
    String password,
    String address,
    String jobTitle,
    String companyId,
    String? departmentId,
    List<String> taskIds,
    int inCompletedTasksCount,
    int completedTasksCount,
    int lateTasksCount,
    int penaltyTasksCount,
    required String createdById,
    String? phoneCountryCode,
    String? phoneNum,
    String nationalNumber,
    @JsonKey(includeToJson: false, includeFromJson: false) bool selected,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get workStartDate;
  @TimestampSerializer()
  set workStartDate(DateTime? value);
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
  String get username;
  set username(String value);
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
  double get salary;
  set salary(double value);
  @override
  String get password;
  set password(String value);
  @override
  String get address;
  set address(String value);
  @override
  String get jobTitle;
  set jobTitle(String value);
  @override
  String get companyId;
  set companyId(String value);
  @override
  String? get departmentId;
  set departmentId(String? value);
  @override
  List<String> get taskIds;
  set taskIds(List<String> value);
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
  int get penaltyTasksCount;
  set penaltyTasksCount(int value);
  @override
  String get createdById;
  set createdById(String value);
  @override
  String? get phoneCountryCode;
  set phoneCountryCode(String? value);
  @override
  String? get phoneNum;
  set phoneNum(String? value);
  @override
  String get nationalNumber;
  set nationalNumber(String value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get selected;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set selected(bool value);

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
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get jobTitle => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;

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
  $Res call({
    String id,
    String displayName,
    String jobTitle,
    String? profilePhoto,
  });
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
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? jobTitle = null,
    Object? profilePhoto = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            displayName:
                null == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String,
            jobTitle:
                null == jobTitle
                    ? _value.jobTitle
                    : jobTitle // ignore: cast_nullable_to_non_nullable
                        as String,
            profilePhoto:
                freezed == profilePhoto
                    ? _value.profilePhoto
                    : profilePhoto // ignore: cast_nullable_to_non_nullable
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
  $Res call({
    String id,
    String displayName,
    String jobTitle,
    String? profilePhoto,
  });
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
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? jobTitle = null,
    Object? profilePhoto = freezed,
  }) {
    return _then(
      _$LightUserModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        displayName:
            null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String,
        jobTitle:
            null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                    as String,
        profilePhoto:
            freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LightUserModelImpl implements _LightUserModel {
  _$LightUserModelImpl({
    this.id = '',
    this.displayName = '',
    this.jobTitle = '',
    this.profilePhoto,
  });

  factory _$LightUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightUserModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String jobTitle;
  @override
  final String? profilePhoto;

  @override
  String toString() {
    return 'LightUserModel(id: $id, displayName: $displayName, jobTitle: $jobTitle, profilePhoto: $profilePhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, displayName, jobTitle, profilePhoto);

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
  factory _LightUserModel({
    final String id,
    final String displayName,
    final String jobTitle,
    final String? profilePhoto,
  }) = _$LightUserModelImpl;

  factory _LightUserModel.fromJson(Map<String, dynamic> json) =
      _$LightUserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get jobTitle;
  @override
  String? get profilePhoto;

  /// Create a copy of LightUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightUserModelImplCopyWith<_$LightUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
