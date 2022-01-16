///
//  Generated code. Do not modify.
//  source: message_schema.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginRequestDataDescriptor instead')
const LoginRequestData$json = const {
  '1': 'LoginRequestData',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequestData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDataDescriptor = $convert.base64Decode('ChBMb2dpblJlcXVlc3REYXRhEhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use loginResponseDataDescriptor instead')
const LoginResponseData$json = const {
  '1': 'LoginResponseData',
  '2': const [
    const {'1': 'auth_token', '3': 1, '4': 1, '5': 9, '10': 'authToken'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.messageschema.UserData', '10': 'user'},
  ],
};

/// Descriptor for `LoginResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDataDescriptor = $convert.base64Decode('ChFMb2dpblJlc3BvbnNlRGF0YRIdCgphdXRoX3Rva2VuGAEgASgJUglhdXRoVG9rZW4SKwoEdXNlchgCIAEoCzIXLm1lc3NhZ2VzY2hlbWEuVXNlckRhdGFSBHVzZXI=');
@$core.Deprecated('Use registerRequestDataDescriptor instead')
const RegisterRequestData$json = const {
  '1': 'RegisterRequestData',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterRequestData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDataDescriptor = $convert.base64Decode('ChNSZWdpc3RlclJlcXVlc3REYXRhEhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use registerResponseDataDescriptor instead')
const RegisterResponseData$json = const {
  '1': 'RegisterResponseData',
  '2': const [
    const {'1': 'auth_token', '3': 1, '4': 1, '5': 9, '10': 'authToken'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.messageschema.UserData', '10': 'user'},
  ],
};

/// Descriptor for `RegisterResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDataDescriptor = $convert.base64Decode('ChRSZWdpc3RlclJlc3BvbnNlRGF0YRIdCgphdXRoX3Rva2VuGAEgASgJUglhdXRoVG9rZW4SKwoEdXNlchgCIAEoCzIXLm1lc3NhZ2VzY2hlbWEuVXNlckRhdGFSBHVzZXI=');
@$core.Deprecated('Use imageDataDescriptor instead')
const ImageData$json = const {
  '1': 'ImageData',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `ImageData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDataDescriptor = $convert.base64Decode('CglJbWFnZURhdGESEgoEZGF0YRgBIAEoDFIEZGF0YQ==');
@$core.Deprecated('Use newFeaturePointRequestDataDescriptor instead')
const NewFeaturePointRequestData$json = const {
  '1': 'NewFeaturePointRequestData',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'location', '3': 3, '4': 1, '5': 11, '6': '.messageschema.LocationData', '10': 'location'},
    const {'1': 'images', '3': 4, '4': 3, '5': 11, '6': '.messageschema.ImageData', '10': 'images'},
  ],
};

/// Descriptor for `NewFeaturePointRequestData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newFeaturePointRequestDataDescriptor = $convert.base64Decode('ChpOZXdGZWF0dXJlUG9pbnRSZXF1ZXN0RGF0YRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEjcKCGxvY2F0aW9uGAMgASgLMhsubWVzc2FnZXNjaGVtYS5Mb2NhdGlvbkRhdGFSCGxvY2F0aW9uEjAKBmltYWdlcxgEIAMoCzIYLm1lc3NhZ2VzY2hlbWEuSW1hZ2VEYXRhUgZpbWFnZXM=');
@$core.Deprecated('Use newFeaturePointResponseDataDescriptor instead')
const NewFeaturePointResponseData$json = const {
  '1': 'NewFeaturePointResponseData',
  '2': const [
    const {'1': 'feature_point', '3': 1, '4': 1, '5': 11, '6': '.messageschema.FeaturePointData', '10': 'featurePoint'},
  ],
};

/// Descriptor for `NewFeaturePointResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newFeaturePointResponseDataDescriptor = $convert.base64Decode('ChtOZXdGZWF0dXJlUG9pbnRSZXNwb25zZURhdGESRAoNZmVhdHVyZV9wb2ludBgBIAEoCzIfLm1lc3NhZ2VzY2hlbWEuRmVhdHVyZVBvaW50RGF0YVIMZmVhdHVyZVBvaW50');
@$core.Deprecated('Use locationDataDescriptor instead')
const LocationData$json = const {
  '1': 'LocationData',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `LocationData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDataDescriptor = $convert.base64Decode('CgxMb2NhdGlvbkRhdGESGgoIbGF0aXR1ZGUYASABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgCIAEoAVIJbG9uZ2l0dWRl');
@$core.Deprecated('Use featurePointDataDescriptor instead')
const FeaturePointData$json = const {
  '1': 'FeaturePointData',
  '2': const [
    const {'1': 'feature_point_id', '3': 1, '4': 1, '5': 3, '10': 'featurePointId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'location', '3': 4, '4': 1, '5': 11, '6': '.messageschema.LocationData', '10': 'location'},
    const {'1': 'owner_id', '3': 5, '4': 1, '5': 3, '10': 'ownerId'},
    const {'1': 'created_at', '3': 6, '4': 1, '5': 3, '10': 'createdAt'},
    const {'1': 'images', '3': 7, '4': 3, '5': 11, '6': '.messageschema.FeaturePointImageData', '10': 'images'},
  ],
};

/// Descriptor for `FeaturePointData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List featurePointDataDescriptor = $convert.base64Decode('ChBGZWF0dXJlUG9pbnREYXRhEigKEGZlYXR1cmVfcG9pbnRfaWQYASABKANSDmZlYXR1cmVQb2ludElkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SNwoIbG9jYXRpb24YBCABKAsyGy5tZXNzYWdlc2NoZW1hLkxvY2F0aW9uRGF0YVIIbG9jYXRpb24SGQoIb3duZXJfaWQYBSABKANSB293bmVySWQSHQoKY3JlYXRlZF9hdBgGIAEoA1IJY3JlYXRlZEF0EjwKBmltYWdlcxgHIAMoCzIkLm1lc3NhZ2VzY2hlbWEuRmVhdHVyZVBvaW50SW1hZ2VEYXRhUgZpbWFnZXM=');
@$core.Deprecated('Use featurePointImageDataDescriptor instead')
const FeaturePointImageData$json = const {
  '1': 'FeaturePointImageData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'image', '3': 2, '4': 1, '5': 11, '6': '.messageschema.NetworkImageData', '10': 'image'},
  ],
};

/// Descriptor for `FeaturePointImageData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List featurePointImageDataDescriptor = $convert.base64Decode('ChVGZWF0dXJlUG9pbnRJbWFnZURhdGESDgoCaWQYASABKAVSAmlkEjUKBWltYWdlGAIgASgLMh8ubWVzc2FnZXNjaGVtYS5OZXR3b3JrSW1hZ2VEYXRhUgVpbWFnZQ==');
@$core.Deprecated('Use networkImageDataDescriptor instead')
const NetworkImageData$json = const {
  '1': 'NetworkImageData',
  '2': const [
    const {'1': 'local_path', '3': 1, '4': 1, '5': 9, '10': 'localPath'},
  ],
};

/// Descriptor for `NetworkImageData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List networkImageDataDescriptor = $convert.base64Decode('ChBOZXR3b3JrSW1hZ2VEYXRhEh0KCmxvY2FsX3BhdGgYASABKAlSCWxvY2FsUGF0aA==');
@$core.Deprecated('Use updateFeaturePointRequestDataDescriptor instead')
const UpdateFeaturePointRequestData$json = const {
  '1': 'UpdateFeaturePointRequestData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'uploaded', '3': 4, '4': 3, '5': 11, '6': '.messageschema.ImageData', '10': 'uploaded'},
    const {'1': 'deleted', '3': 5, '4': 3, '5': 11, '6': '.messageschema.FeaturePointImageData', '10': 'deleted'},
  ],
};

/// Descriptor for `UpdateFeaturePointRequestData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFeaturePointRequestDataDescriptor = $convert.base64Decode('Ch1VcGRhdGVGZWF0dXJlUG9pbnRSZXF1ZXN0RGF0YRIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhI0Cgh1cGxvYWRlZBgEIAMoCzIYLm1lc3NhZ2VzY2hlbWEuSW1hZ2VEYXRhUgh1cGxvYWRlZBI+CgdkZWxldGVkGAUgAygLMiQubWVzc2FnZXNjaGVtYS5GZWF0dXJlUG9pbnRJbWFnZURhdGFSB2RlbGV0ZWQ=');
@$core.Deprecated('Use updateFeaturePointResponseDataDescriptor instead')
const UpdateFeaturePointResponseData$json = const {
  '1': 'UpdateFeaturePointResponseData',
};

/// Descriptor for `UpdateFeaturePointResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFeaturePointResponseDataDescriptor = $convert.base64Decode('Ch5VcGRhdGVGZWF0dXJlUG9pbnRSZXNwb25zZURhdGE=');
@$core.Deprecated('Use getAllFeaturePointsWithinBoundsResponseDataDescriptor instead')
const GetAllFeaturePointsWithinBoundsResponseData$json = const {
  '1': 'GetAllFeaturePointsWithinBoundsResponseData',
  '2': const [
    const {'1': 'feature_points', '3': 1, '4': 3, '5': 11, '6': '.messageschema.FeaturePointData', '10': 'featurePoints'},
  ],
};

/// Descriptor for `GetAllFeaturePointsWithinBoundsResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllFeaturePointsWithinBoundsResponseDataDescriptor = $convert.base64Decode('CitHZXRBbGxGZWF0dXJlUG9pbnRzV2l0aGluQm91bmRzUmVzcG9uc2VEYXRhEkYKDmZlYXR1cmVfcG9pbnRzGAEgAygLMh8ubWVzc2FnZXNjaGVtYS5GZWF0dXJlUG9pbnREYXRhUg1mZWF0dXJlUG9pbnRz');
@$core.Deprecated('Use getUserByIdResponseDataDescriptor instead')
const GetUserByIdResponseData$json = const {
  '1': 'GetUserByIdResponseData',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.messageschema.UserData', '10': 'user'},
  ],
};

/// Descriptor for `GetUserByIdResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserByIdResponseDataDescriptor = $convert.base64Decode('ChdHZXRVc2VyQnlJZFJlc3BvbnNlRGF0YRIrCgR1c2VyGAEgASgLMhcubWVzc2FnZXNjaGVtYS5Vc2VyRGF0YVIEdXNlcg==');
@$core.Deprecated('Use userDataDescriptor instead')
const UserData$json = const {
  '1': 'UserData',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'about', '3': 3, '4': 1, '5': 9, '10': 'about'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 3, '10': 'createdAt'},
    const {'1': 'profile_image', '3': 5, '4': 1, '5': 11, '6': '.messageschema.NetworkImageData', '10': 'profileImage'},
  ],
};

/// Descriptor for `UserData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDataDescriptor = $convert.base64Decode('CghVc2VyRGF0YRIXCgd1c2VyX2lkGAEgASgDUgZ1c2VySWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEhQKBWFib3V0GAMgASgJUgVhYm91dBIdCgpjcmVhdGVkX2F0GAQgASgDUgljcmVhdGVkQXQSRAoNcHJvZmlsZV9pbWFnZRgFIAEoCzIfLm1lc3NhZ2VzY2hlbWEuTmV0d29ya0ltYWdlRGF0YVIMcHJvZmlsZUltYWdl');
@$core.Deprecated('Use deleteFeaturePointResponseDataDescriptor instead')
const DeleteFeaturePointResponseData$json = const {
  '1': 'DeleteFeaturePointResponseData',
};

/// Descriptor for `DeleteFeaturePointResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFeaturePointResponseDataDescriptor = $convert.base64Decode('Ch5EZWxldGVGZWF0dXJlUG9pbnRSZXNwb25zZURhdGE=');
@$core.Deprecated('Use newProfileImageRequestDataDescriptor instead')
const NewProfileImageRequestData$json = const {
  '1': 'NewProfileImageRequestData',
  '2': const [
    const {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.messageschema.ImageData', '10': 'image'},
  ],
};

/// Descriptor for `NewProfileImageRequestData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newProfileImageRequestDataDescriptor = $convert.base64Decode('ChpOZXdQcm9maWxlSW1hZ2VSZXF1ZXN0RGF0YRIuCgVpbWFnZRgBIAEoCzIYLm1lc3NhZ2VzY2hlbWEuSW1hZ2VEYXRhUgVpbWFnZQ==');
@$core.Deprecated('Use newProfileImageResponseDataDescriptor instead')
const NewProfileImageResponseData$json = const {
  '1': 'NewProfileImageResponseData',
  '2': const [
    const {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.messageschema.NetworkImageData', '10': 'image'},
  ],
};

/// Descriptor for `NewProfileImageResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newProfileImageResponseDataDescriptor = $convert.base64Decode('ChtOZXdQcm9maWxlSW1hZ2VSZXNwb25zZURhdGESNQoFaW1hZ2UYASABKAsyHy5tZXNzYWdlc2NoZW1hLk5ldHdvcmtJbWFnZURhdGFSBWltYWdl');
@$core.Deprecated('Use updateUserProfileRequestDataDescriptor instead')
const UpdateUserProfileRequestData$json = const {
  '1': 'UpdateUserProfileRequestData',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'about', '3': 2, '4': 1, '5': 9, '10': 'about'},
  ],
};

/// Descriptor for `UpdateUserProfileRequestData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserProfileRequestDataDescriptor = $convert.base64Decode('ChxVcGRhdGVVc2VyUHJvZmlsZVJlcXVlc3REYXRhEhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIUCgVhYm91dBgCIAEoCVIFYWJvdXQ=');
@$core.Deprecated('Use updateUserProfileResponseDataDescriptor instead')
const UpdateUserProfileResponseData$json = const {
  '1': 'UpdateUserProfileResponseData',
};

/// Descriptor for `UpdateUserProfileResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserProfileResponseDataDescriptor = $convert.base64Decode('Ch1VcGRhdGVVc2VyUHJvZmlsZVJlc3BvbnNlRGF0YQ==');
