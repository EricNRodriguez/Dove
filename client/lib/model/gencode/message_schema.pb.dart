///
//  Generated code. Do not modify.
//  source: message_schema.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class LoginRequestData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequestData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginRequestData._() : super();
  factory LoginRequestData({
    $core.String? username,
    $core.String? password,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginRequestData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequestData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequestData clone() => LoginRequestData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequestData copyWith(void Function(LoginRequestData) updates) => super.copyWith((message) => updates(message as LoginRequestData)) as LoginRequestData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequestData create() => LoginRequestData._();
  LoginRequestData createEmptyInstance() => create();
  static $pb.PbList<LoginRequestData> createRepeated() => $pb.PbList<LoginRequestData>();
  @$core.pragma('dart2js:noInline')
  static LoginRequestData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequestData>(create);
  static LoginRequestData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authToken')
    ..aOM<UserData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: UserData.create)
    ..hasRequiredFields = false
  ;

  LoginResponseData._() : super();
  factory LoginResponseData({
    $core.String? authToken,
    UserData? user,
  }) {
    final _result = create();
    if (authToken != null) {
      _result.authToken = authToken;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory LoginResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResponseData clone() => LoginResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResponseData copyWith(void Function(LoginResponseData) updates) => super.copyWith((message) => updates(message as LoginResponseData)) as LoginResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginResponseData create() => LoginResponseData._();
  LoginResponseData createEmptyInstance() => create();
  static $pb.PbList<LoginResponseData> createRepeated() => $pb.PbList<LoginResponseData>();
  @$core.pragma('dart2js:noInline')
  static LoginResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponseData>(create);
  static LoginResponseData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set authToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthToken() => clearField(1);

  @$pb.TagNumber(2)
  UserData get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(UserData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  UserData ensureUser() => $_ensure(1);
}

class RegisterRequestData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterRequestData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  RegisterRequestData._() : super();
  factory RegisterRequestData({
    $core.String? username,
    $core.String? password,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory RegisterRequestData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequestData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequestData clone() => RegisterRequestData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequestData copyWith(void Function(RegisterRequestData) updates) => super.copyWith((message) => updates(message as RegisterRequestData)) as RegisterRequestData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequestData create() => RegisterRequestData._();
  RegisterRequestData createEmptyInstance() => create();
  static $pb.PbList<RegisterRequestData> createRepeated() => $pb.PbList<RegisterRequestData>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequestData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequestData>(create);
  static RegisterRequestData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class RegisterResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authToken')
    ..aOM<UserData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: UserData.create)
    ..hasRequiredFields = false
  ;

  RegisterResponseData._() : super();
  factory RegisterResponseData({
    $core.String? authToken,
    UserData? user,
  }) {
    final _result = create();
    if (authToken != null) {
      _result.authToken = authToken;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory RegisterResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterResponseData clone() => RegisterResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterResponseData copyWith(void Function(RegisterResponseData) updates) => super.copyWith((message) => updates(message as RegisterResponseData)) as RegisterResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterResponseData create() => RegisterResponseData._();
  RegisterResponseData createEmptyInstance() => create();
  static $pb.PbList<RegisterResponseData> createRepeated() => $pb.PbList<RegisterResponseData>();
  @$core.pragma('dart2js:noInline')
  static RegisterResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterResponseData>(create);
  static RegisterResponseData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set authToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthToken() => clearField(1);

  @$pb.TagNumber(2)
  UserData get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(UserData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  UserData ensureUser() => $_ensure(1);
}

class ImageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ImageData._() : super();
  factory ImageData({
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ImageData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageData clone() => ImageData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageData copyWith(void Function(ImageData) updates) => super.copyWith((message) => updates(message as ImageData)) as ImageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageData create() => ImageData._();
  ImageData createEmptyInstance() => create();
  static $pb.PbList<ImageData> createRepeated() => $pb.PbList<ImageData>();
  @$core.pragma('dart2js:noInline')
  static ImageData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageData>(create);
  static ImageData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class NewFeaturePointRequestData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewFeaturePointRequestData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<LocationData>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location', subBuilder: LocationData.create)
    ..pc<ImageData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'images', $pb.PbFieldType.PM, subBuilder: ImageData.create)
    ..hasRequiredFields = false
  ;

  NewFeaturePointRequestData._() : super();
  factory NewFeaturePointRequestData({
    $core.String? title,
    $core.String? description,
    LocationData? location,
    $core.Iterable<ImageData>? images,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (location != null) {
      _result.location = location;
    }
    if (images != null) {
      _result.images.addAll(images);
    }
    return _result;
  }
  factory NewFeaturePointRequestData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewFeaturePointRequestData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewFeaturePointRequestData clone() => NewFeaturePointRequestData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewFeaturePointRequestData copyWith(void Function(NewFeaturePointRequestData) updates) => super.copyWith((message) => updates(message as NewFeaturePointRequestData)) as NewFeaturePointRequestData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewFeaturePointRequestData create() => NewFeaturePointRequestData._();
  NewFeaturePointRequestData createEmptyInstance() => create();
  static $pb.PbList<NewFeaturePointRequestData> createRepeated() => $pb.PbList<NewFeaturePointRequestData>();
  @$core.pragma('dart2js:noInline')
  static NewFeaturePointRequestData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewFeaturePointRequestData>(create);
  static NewFeaturePointRequestData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  LocationData get location => $_getN(2);
  @$pb.TagNumber(3)
  set location(LocationData v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocation() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocation() => clearField(3);
  @$pb.TagNumber(3)
  LocationData ensureLocation() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<ImageData> get images => $_getList(3);
}

class NewFeaturePointResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewFeaturePointResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOM<FeaturePointData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'featurePoint', subBuilder: FeaturePointData.create)
    ..hasRequiredFields = false
  ;

  NewFeaturePointResponseData._() : super();
  factory NewFeaturePointResponseData({
    FeaturePointData? featurePoint,
  }) {
    final _result = create();
    if (featurePoint != null) {
      _result.featurePoint = featurePoint;
    }
    return _result;
  }
  factory NewFeaturePointResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewFeaturePointResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewFeaturePointResponseData clone() => NewFeaturePointResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewFeaturePointResponseData copyWith(void Function(NewFeaturePointResponseData) updates) => super.copyWith((message) => updates(message as NewFeaturePointResponseData)) as NewFeaturePointResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewFeaturePointResponseData create() => NewFeaturePointResponseData._();
  NewFeaturePointResponseData createEmptyInstance() => create();
  static $pb.PbList<NewFeaturePointResponseData> createRepeated() => $pb.PbList<NewFeaturePointResponseData>();
  @$core.pragma('dart2js:noInline')
  static NewFeaturePointResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewFeaturePointResponseData>(create);
  static NewFeaturePointResponseData? _defaultInstance;

  @$pb.TagNumber(1)
  FeaturePointData get featurePoint => $_getN(0);
  @$pb.TagNumber(1)
  set featurePoint(FeaturePointData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFeaturePoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeaturePoint() => clearField(1);
  @$pb.TagNumber(1)
  FeaturePointData ensureFeaturePoint() => $_ensure(0);
}

class LocationData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LocationData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  LocationData._() : super();
  factory LocationData({
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final _result = create();
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    return _result;
  }
  factory LocationData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocationData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocationData clone() => LocationData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocationData copyWith(void Function(LocationData) updates) => super.copyWith((message) => updates(message as LocationData)) as LocationData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LocationData create() => LocationData._();
  LocationData createEmptyInstance() => create();
  static $pb.PbList<LocationData> createRepeated() => $pb.PbList<LocationData>();
  @$core.pragma('dart2js:noInline')
  static LocationData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocationData>(create);
  static LocationData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => clearField(2);
}

class FeaturePointData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FeaturePointData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'featurePointId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<LocationData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location', subBuilder: LocationData.create)
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ownerId')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt')
    ..pc<FeaturePointImageData>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'images', $pb.PbFieldType.PM, subBuilder: FeaturePointImageData.create)
    ..hasRequiredFields = false
  ;

  FeaturePointData._() : super();
  factory FeaturePointData({
    $fixnum.Int64? featurePointId,
    $core.String? title,
    $core.String? description,
    LocationData? location,
    $fixnum.Int64? ownerId,
    $fixnum.Int64? createdAt,
    $core.Iterable<FeaturePointImageData>? images,
  }) {
    final _result = create();
    if (featurePointId != null) {
      _result.featurePointId = featurePointId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (location != null) {
      _result.location = location;
    }
    if (ownerId != null) {
      _result.ownerId = ownerId;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (images != null) {
      _result.images.addAll(images);
    }
    return _result;
  }
  factory FeaturePointData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeaturePointData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeaturePointData clone() => FeaturePointData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeaturePointData copyWith(void Function(FeaturePointData) updates) => super.copyWith((message) => updates(message as FeaturePointData)) as FeaturePointData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeaturePointData create() => FeaturePointData._();
  FeaturePointData createEmptyInstance() => create();
  static $pb.PbList<FeaturePointData> createRepeated() => $pb.PbList<FeaturePointData>();
  @$core.pragma('dart2js:noInline')
  static FeaturePointData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeaturePointData>(create);
  static FeaturePointData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get featurePointId => $_getI64(0);
  @$pb.TagNumber(1)
  set featurePointId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFeaturePointId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeaturePointId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  LocationData get location => $_getN(3);
  @$pb.TagNumber(4)
  set location(LocationData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => clearField(4);
  @$pb.TagNumber(4)
  LocationData ensureLocation() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get ownerId => $_getI64(4);
  @$pb.TagNumber(5)
  set ownerId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOwnerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnerId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createdAt => $_getI64(5);
  @$pb.TagNumber(6)
  set createdAt($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<FeaturePointImageData> get images => $_getList(6);
}

class FeaturePointImageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FeaturePointImageData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<NetworkImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: NetworkImageData.create)
    ..hasRequiredFields = false
  ;

  FeaturePointImageData._() : super();
  factory FeaturePointImageData({
    $core.int? id,
    NetworkImageData? image,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory FeaturePointImageData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeaturePointImageData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeaturePointImageData clone() => FeaturePointImageData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeaturePointImageData copyWith(void Function(FeaturePointImageData) updates) => super.copyWith((message) => updates(message as FeaturePointImageData)) as FeaturePointImageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeaturePointImageData create() => FeaturePointImageData._();
  FeaturePointImageData createEmptyInstance() => create();
  static $pb.PbList<FeaturePointImageData> createRepeated() => $pb.PbList<FeaturePointImageData>();
  @$core.pragma('dart2js:noInline')
  static FeaturePointImageData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeaturePointImageData>(create);
  static FeaturePointImageData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  NetworkImageData get image => $_getN(1);
  @$pb.TagNumber(2)
  set image(NetworkImageData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);
  @$pb.TagNumber(2)
  NetworkImageData ensureImage() => $_ensure(1);
}

class NetworkImageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NetworkImageData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'localPath')
    ..hasRequiredFields = false
  ;

  NetworkImageData._() : super();
  factory NetworkImageData({
    $core.String? localPath,
  }) {
    final _result = create();
    if (localPath != null) {
      _result.localPath = localPath;
    }
    return _result;
  }
  factory NetworkImageData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NetworkImageData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NetworkImageData clone() => NetworkImageData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NetworkImageData copyWith(void Function(NetworkImageData) updates) => super.copyWith((message) => updates(message as NetworkImageData)) as NetworkImageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NetworkImageData create() => NetworkImageData._();
  NetworkImageData createEmptyInstance() => create();
  static $pb.PbList<NetworkImageData> createRepeated() => $pb.PbList<NetworkImageData>();
  @$core.pragma('dart2js:noInline')
  static NetworkImageData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NetworkImageData>(create);
  static NetworkImageData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set localPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalPath() => clearField(1);
}

class UpdateFeaturePointRequestData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateFeaturePointRequestData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..pc<ImageData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploaded', $pb.PbFieldType.PM, subBuilder: ImageData.create)
    ..pc<FeaturePointImageData>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleted', $pb.PbFieldType.PM, subBuilder: FeaturePointImageData.create)
    ..hasRequiredFields = false
  ;

  UpdateFeaturePointRequestData._() : super();
  factory UpdateFeaturePointRequestData({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.Iterable<ImageData>? uploaded,
    $core.Iterable<FeaturePointImageData>? deleted,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (uploaded != null) {
      _result.uploaded.addAll(uploaded);
    }
    if (deleted != null) {
      _result.deleted.addAll(deleted);
    }
    return _result;
  }
  factory UpdateFeaturePointRequestData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFeaturePointRequestData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFeaturePointRequestData clone() => UpdateFeaturePointRequestData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFeaturePointRequestData copyWith(void Function(UpdateFeaturePointRequestData) updates) => super.copyWith((message) => updates(message as UpdateFeaturePointRequestData)) as UpdateFeaturePointRequestData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateFeaturePointRequestData create() => UpdateFeaturePointRequestData._();
  UpdateFeaturePointRequestData createEmptyInstance() => create();
  static $pb.PbList<UpdateFeaturePointRequestData> createRepeated() => $pb.PbList<UpdateFeaturePointRequestData>();
  @$core.pragma('dart2js:noInline')
  static UpdateFeaturePointRequestData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFeaturePointRequestData>(create);
  static UpdateFeaturePointRequestData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ImageData> get uploaded => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<FeaturePointImageData> get deleted => $_getList(4);
}

class UpdateFeaturePointResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateFeaturePointResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateFeaturePointResponseData._() : super();
  factory UpdateFeaturePointResponseData() => create();
  factory UpdateFeaturePointResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFeaturePointResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFeaturePointResponseData clone() => UpdateFeaturePointResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFeaturePointResponseData copyWith(void Function(UpdateFeaturePointResponseData) updates) => super.copyWith((message) => updates(message as UpdateFeaturePointResponseData)) as UpdateFeaturePointResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateFeaturePointResponseData create() => UpdateFeaturePointResponseData._();
  UpdateFeaturePointResponseData createEmptyInstance() => create();
  static $pb.PbList<UpdateFeaturePointResponseData> createRepeated() => $pb.PbList<UpdateFeaturePointResponseData>();
  @$core.pragma('dart2js:noInline')
  static UpdateFeaturePointResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFeaturePointResponseData>(create);
  static UpdateFeaturePointResponseData? _defaultInstance;
}

class GetAllFeaturePointsWithinBoundsResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAllFeaturePointsWithinBoundsResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..pc<FeaturePointData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'featurePoints', $pb.PbFieldType.PM, subBuilder: FeaturePointData.create)
    ..hasRequiredFields = false
  ;

  GetAllFeaturePointsWithinBoundsResponseData._() : super();
  factory GetAllFeaturePointsWithinBoundsResponseData({
    $core.Iterable<FeaturePointData>? featurePoints,
  }) {
    final _result = create();
    if (featurePoints != null) {
      _result.featurePoints.addAll(featurePoints);
    }
    return _result;
  }
  factory GetAllFeaturePointsWithinBoundsResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllFeaturePointsWithinBoundsResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllFeaturePointsWithinBoundsResponseData clone() => GetAllFeaturePointsWithinBoundsResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllFeaturePointsWithinBoundsResponseData copyWith(void Function(GetAllFeaturePointsWithinBoundsResponseData) updates) => super.copyWith((message) => updates(message as GetAllFeaturePointsWithinBoundsResponseData)) as GetAllFeaturePointsWithinBoundsResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAllFeaturePointsWithinBoundsResponseData create() => GetAllFeaturePointsWithinBoundsResponseData._();
  GetAllFeaturePointsWithinBoundsResponseData createEmptyInstance() => create();
  static $pb.PbList<GetAllFeaturePointsWithinBoundsResponseData> createRepeated() => $pb.PbList<GetAllFeaturePointsWithinBoundsResponseData>();
  @$core.pragma('dart2js:noInline')
  static GetAllFeaturePointsWithinBoundsResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllFeaturePointsWithinBoundsResponseData>(create);
  static GetAllFeaturePointsWithinBoundsResponseData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FeaturePointData> get featurePoints => $_getList(0);
}

class GetUserByIdResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserByIdResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOM<UserData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: UserData.create)
    ..hasRequiredFields = false
  ;

  GetUserByIdResponseData._() : super();
  factory GetUserByIdResponseData({
    UserData? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory GetUserByIdResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserByIdResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserByIdResponseData clone() => GetUserByIdResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserByIdResponseData copyWith(void Function(GetUserByIdResponseData) updates) => super.copyWith((message) => updates(message as GetUserByIdResponseData)) as GetUserByIdResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserByIdResponseData create() => GetUserByIdResponseData._();
  GetUserByIdResponseData createEmptyInstance() => create();
  static $pb.PbList<GetUserByIdResponseData> createRepeated() => $pb.PbList<GetUserByIdResponseData>();
  @$core.pragma('dart2js:noInline')
  static GetUserByIdResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserByIdResponseData>(create);
  static GetUserByIdResponseData? _defaultInstance;

  @$pb.TagNumber(1)
  UserData get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserData ensureUser() => $_ensure(0);
}

class UserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'about')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt')
    ..aOM<NetworkImageData>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profileImage', subBuilder: NetworkImageData.create)
    ..hasRequiredFields = false
  ;

  UserData._() : super();
  factory UserData({
    $fixnum.Int64? userId,
    $core.String? username,
    $core.String? about,
    $fixnum.Int64? createdAt,
    NetworkImageData? profileImage,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (username != null) {
      _result.username = username;
    }
    if (about != null) {
      _result.about = about;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (profileImage != null) {
      _result.profileImage = profileImage;
    }
    return _result;
  }
  factory UserData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserData clone() => UserData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserData copyWith(void Function(UserData) updates) => super.copyWith((message) => updates(message as UserData)) as UserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserData create() => UserData._();
  UserData createEmptyInstance() => create();
  static $pb.PbList<UserData> createRepeated() => $pb.PbList<UserData>();
  @$core.pragma('dart2js:noInline')
  static UserData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserData>(create);
  static UserData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get about => $_getSZ(2);
  @$pb.TagNumber(3)
  set about($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbout() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbout() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createdAt => $_getI64(3);
  @$pb.TagNumber(4)
  set createdAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);

  @$pb.TagNumber(5)
  NetworkImageData get profileImage => $_getN(4);
  @$pb.TagNumber(5)
  set profileImage(NetworkImageData v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasProfileImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearProfileImage() => clearField(5);
  @$pb.TagNumber(5)
  NetworkImageData ensureProfileImage() => $_ensure(4);
}

class DeleteFeaturePointResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteFeaturePointResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeleteFeaturePointResponseData._() : super();
  factory DeleteFeaturePointResponseData() => create();
  factory DeleteFeaturePointResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFeaturePointResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFeaturePointResponseData clone() => DeleteFeaturePointResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFeaturePointResponseData copyWith(void Function(DeleteFeaturePointResponseData) updates) => super.copyWith((message) => updates(message as DeleteFeaturePointResponseData)) as DeleteFeaturePointResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteFeaturePointResponseData create() => DeleteFeaturePointResponseData._();
  DeleteFeaturePointResponseData createEmptyInstance() => create();
  static $pb.PbList<DeleteFeaturePointResponseData> createRepeated() => $pb.PbList<DeleteFeaturePointResponseData>();
  @$core.pragma('dart2js:noInline')
  static DeleteFeaturePointResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFeaturePointResponseData>(create);
  static DeleteFeaturePointResponseData? _defaultInstance;
}

class NewProfileImageRequestData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewProfileImageRequestData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOM<ImageData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: ImageData.create)
    ..hasRequiredFields = false
  ;

  NewProfileImageRequestData._() : super();
  factory NewProfileImageRequestData({
    ImageData? image,
  }) {
    final _result = create();
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory NewProfileImageRequestData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewProfileImageRequestData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewProfileImageRequestData clone() => NewProfileImageRequestData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewProfileImageRequestData copyWith(void Function(NewProfileImageRequestData) updates) => super.copyWith((message) => updates(message as NewProfileImageRequestData)) as NewProfileImageRequestData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewProfileImageRequestData create() => NewProfileImageRequestData._();
  NewProfileImageRequestData createEmptyInstance() => create();
  static $pb.PbList<NewProfileImageRequestData> createRepeated() => $pb.PbList<NewProfileImageRequestData>();
  @$core.pragma('dart2js:noInline')
  static NewProfileImageRequestData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewProfileImageRequestData>(create);
  static NewProfileImageRequestData? _defaultInstance;

  @$pb.TagNumber(1)
  ImageData get image => $_getN(0);
  @$pb.TagNumber(1)
  set image(ImageData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
  @$pb.TagNumber(1)
  ImageData ensureImage() => $_ensure(0);
}

class NewProfileImageResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewProfileImageResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOM<NetworkImageData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: NetworkImageData.create)
    ..hasRequiredFields = false
  ;

  NewProfileImageResponseData._() : super();
  factory NewProfileImageResponseData({
    NetworkImageData? image,
  }) {
    final _result = create();
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory NewProfileImageResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewProfileImageResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewProfileImageResponseData clone() => NewProfileImageResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewProfileImageResponseData copyWith(void Function(NewProfileImageResponseData) updates) => super.copyWith((message) => updates(message as NewProfileImageResponseData)) as NewProfileImageResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewProfileImageResponseData create() => NewProfileImageResponseData._();
  NewProfileImageResponseData createEmptyInstance() => create();
  static $pb.PbList<NewProfileImageResponseData> createRepeated() => $pb.PbList<NewProfileImageResponseData>();
  @$core.pragma('dart2js:noInline')
  static NewProfileImageResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewProfileImageResponseData>(create);
  static NewProfileImageResponseData? _defaultInstance;

  @$pb.TagNumber(1)
  NetworkImageData get image => $_getN(0);
  @$pb.TagNumber(1)
  set image(NetworkImageData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
  @$pb.TagNumber(1)
  NetworkImageData ensureImage() => $_ensure(0);
}

class UpdateUserProfileRequestData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserProfileRequestData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'about')
    ..hasRequiredFields = false
  ;

  UpdateUserProfileRequestData._() : super();
  factory UpdateUserProfileRequestData({
    $core.String? username,
    $core.String? about,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (about != null) {
      _result.about = about;
    }
    return _result;
  }
  factory UpdateUserProfileRequestData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserProfileRequestData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserProfileRequestData clone() => UpdateUserProfileRequestData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserProfileRequestData copyWith(void Function(UpdateUserProfileRequestData) updates) => super.copyWith((message) => updates(message as UpdateUserProfileRequestData)) as UpdateUserProfileRequestData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileRequestData create() => UpdateUserProfileRequestData._();
  UpdateUserProfileRequestData createEmptyInstance() => create();
  static $pb.PbList<UpdateUserProfileRequestData> createRepeated() => $pb.PbList<UpdateUserProfileRequestData>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileRequestData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserProfileRequestData>(create);
  static UpdateUserProfileRequestData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get about => $_getSZ(1);
  @$pb.TagNumber(2)
  set about($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAbout() => $_has(1);
  @$pb.TagNumber(2)
  void clearAbout() => clearField(2);
}

class UpdateUserProfileResponseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserProfileResponseData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messageschema'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateUserProfileResponseData._() : super();
  factory UpdateUserProfileResponseData() => create();
  factory UpdateUserProfileResponseData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserProfileResponseData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserProfileResponseData clone() => UpdateUserProfileResponseData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserProfileResponseData copyWith(void Function(UpdateUserProfileResponseData) updates) => super.copyWith((message) => updates(message as UpdateUserProfileResponseData)) as UpdateUserProfileResponseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileResponseData create() => UpdateUserProfileResponseData._();
  UpdateUserProfileResponseData createEmptyInstance() => create();
  static $pb.PbList<UpdateUserProfileResponseData> createRepeated() => $pb.PbList<UpdateUserProfileResponseData>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserProfileResponseData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserProfileResponseData>(create);
  static UpdateUserProfileResponseData? _defaultInstance;
}

