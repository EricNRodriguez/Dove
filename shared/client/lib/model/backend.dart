import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'SessionState.dart';

class Backend {
  static const String _AUTH_HEADER = 'Dove-Auth';

  final String _protocol;
  final String _host;
  final int _port;

  Backend(this._protocol, this._host, this._port);

  Future<HttpResp<LoginResponseData>> login(LoginRequestData loginRequest) async {
    var resp = await http.post(
        Uri.parse('$_protocol://$_host:$_port/login'), body: jsonEncode(loginRequest.toProto3Json()));

    HttpResp<LoginResponseData> loginResponse = HttpResp.fromResponse<
        LoginResponseData>(resp, (Map<String, dynamic> json) => LoginResponseData.create()..mergeFromProto3Json(json));

    return loginResponse;
  }

  Future<HttpResp<RegisterResponseData>> register(RegisterRequestData registerRequest) async {

    var resp = await http.post(
        Uri.parse('$_protocol://$_host:$_port/register'), body: jsonEncode(registerRequest.toProto3Json()));

    HttpResp<RegisterResponseData> registerResp = HttpResp.fromResponse<
        RegisterResponseData>(resp, (Map<String, dynamic> json) => RegisterResponseData.create()..mergeFromProto3Json(json));

    return registerResp;
  }

  Future<HttpResp<GetUserByIdResponseData>> getUserById(SessionState sessionState, int userId) async {
    var resp = await http.get(
      Uri.parse('$_protocol://$_host:$_port/user/$userId'),
      headers: {
        _AUTH_HEADER: sessionState.apiToken,
      },
    );

    HttpResp<GetUserByIdResponseData> getUserByIdResp = HttpResp.fromResponse(
      resp,
          (Map<String, dynamic> json) => GetUserByIdResponseData.create()..mergeFromProto3Json(json),
    );

    return getUserByIdResp;
  }

  Future<HttpResp<NewFeaturePointResponseData>> createFeaturePoint(SessionState sessionContext, NewFeaturePointRequestData newFeaturePointRequest) async {
    var resp = await http.post(
      Uri.parse('$_protocol://$_host:$_port/feature-point'),
      body: jsonEncode(newFeaturePointRequest.toProto3Json()),
      headers: {
        _AUTH_HEADER: sessionContext.apiToken,
      },
    );

    HttpResp<NewFeaturePointResponseData> createFeaturePointResp = HttpResp.fromResponse(
        resp,
        (Map<String,dynamic> json) => NewFeaturePointResponseData.create()..mergeFromProto3Json(json),
    );

    return createFeaturePointResp;
  }

  Future<HttpResp<GetAllFeaturePointsWithinBoundsResponseData>> getAllFeaturePointsWithinBounds(SessionState sessionState, LatLng center, double radiusMeters) async {
    var queryParams = {
      'lat': center.latitude.toString(),
      'lng': center.longitude.toString(),
      'radius_meters': radiusMeters.toString(),
    };

    var resp = await http.get(
      Uri.parse('$_protocol://$_host:$_port/feature-point').replace(queryParameters: queryParams),
      headers: {
        _AUTH_HEADER: sessionState.apiToken,
      },
    );

    HttpResp<GetAllFeaturePointsWithinBoundsResponseData> getAllFeaturePointsResp = HttpResp.fromResponse(
        resp,
        (Map<String, dynamic> json) => GetAllFeaturePointsWithinBoundsResponseData.create()..mergeFromProto3Json(json),
    );

    return getAllFeaturePointsResp;
  }

  Future<HttpResp<UpdateFeaturePointResponseData>> updateFeaturePoint(SessionState sessionState, UpdateFeaturePointRequestData updateRequest) async {
    var resp = await http.put(
      Uri.parse('$_protocol://$_host:$_port/feature-point'),
      headers: {
        _AUTH_HEADER: sessionState.apiToken,
      },
      body: jsonEncode(updateRequest.toProto3Json())
    );


    return HttpResp.fromResponse(resp, (json) => UpdateFeaturePointResponseData.create()..mergeFromProto3Json(json));
  }

  Future<HttpResp<DeleteFeaturePointResponseData>> deleteFeaturePoint(SessionState sessionState, int featurePointId) async {
    var resp = await http.delete(
      Uri.parse('$_protocol://$_host:$_port/feature-point/$featurePointId'),
      headers: {
        _AUTH_HEADER: sessionState.apiToken,
      },
    );

    return HttpResp.fromResponse(resp, (json) => DeleteFeaturePointResponseData.create()..mergeFromProto3Json(json));
  }

  CachedNetworkImage getImage(SessionState sessionState, String hash, {
    double? height,
    Image? defaultImage,
  }) {
    return CachedNetworkImage(
      imageUrl: '$_protocol://$_host:$_port/image/$hash',
      placeholder: (context, url) => new CircularProgressIndicator(),
      height: height,
      fit: BoxFit.cover,
      httpHeaders: {
        _AUTH_HEADER: sessionState.apiToken,
      },
      errorWidget: defaultImage != null ? (context, error, stackTrace) {
        return defaultImage;
      } : null,
    );
  }

  Future<HttpResp<NewProfileImageResponseData>> updateProfileImage(SessionState sessionState, NewProfileImageRequestData request) async {
    var resp = await http.put(
        Uri.parse('$_protocol://$_host:$_port/user/${sessionState.user.userId}/profile-image'),
        headers: {
          _AUTH_HEADER: sessionState.apiToken,
        },
        body: jsonEncode(request.toProto3Json())
    );


    return HttpResp.fromResponse(resp, (json) => NewProfileImageResponseData.create()..mergeFromProto3Json(json));
  }

  Future<HttpResp<UpdateUserProfileResponseData>> updateProfileData(SessionState sessionState, UpdateUserProfileRequestData request) async {
    var resp = await http.put(
        Uri.parse('$_protocol://$_host:$_port/user/${sessionState.user.userId}/data'),
        headers: {
          _AUTH_HEADER: sessionState.apiToken,
        },
        body: jsonEncode(request.toProto3Json())
    );


    return HttpResp.fromResponse(resp, (json) => UpdateUserProfileResponseData.create()..mergeFromProto3Json(json));
  }
}

typedef EmptyResp = String;

class HttpResp<T> {
  final T? _data;
  final HttpError? _error;

  bool isData() {
    return _data != null;
  }

  T asData() {
    assert(isData());
    return _data!;
  }

  bool isError() {
    return _error != null;
  }

  HttpError asError() {
    assert(isError());
    return _error!;
  }

  static HttpResp<T> fromResponse<T>(Response response, T dataFromJson(Map<String, dynamic> json)) {
    var body = jsonDecode(response.body);
    dynamic data = body["data"];
    dynamic error = body["error"];

    int statusCode = response.statusCode;

    if (statusCode != HttpStatus.ok) {
      return HttpResp._(null, new HttpError(statusCode, (error ?? "") as String));
    } else {
      return HttpResp._(dataFromJson(data), null);
    }
  }

  HttpResp._(this._data, this._error);
}

class HttpError {
  final int status;
  final String message;

  HttpError(this.status, this.message);
}