import 'package:client/model/SessionState.dart';
import 'package:client/model/backend.dart';
import 'package:client/model/bounds.dart';
import 'package:client/model/feature_point.dart';
import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:flutter/material.dart';

class FeaturePointCache extends ChangeNotifier {
  final Backend _backend;

  CircularBounds? _prevFetchBounds;
  List<FeaturePoint> _prevFetchFeaturePoints = [];

  FeaturePointCache(this._backend) : super();

  /// Fetches all feature points within the query circle that contains all vertices
  /// of the current bounds multiplied by 5 on its perimeter.
  /// The current implementation is a "good enough" policy, based on the
  /// observation that users typically only care about points within their
  /// general area, for which the extended fetch bounds covered in the majority
  /// of cases.
  Future<List<FeaturePoint>> getFeaturePoints(SessionState sessionState, {
    required CircularBounds bounds,
  }) async {
    if (_prevFetchBounds?.contains(bounds) == true) {
      return Future.value(_prevFetchFeaturePoints);
    }

    bounds = bounds.grow(5);
    _prevFetchBounds = bounds;

    HttpResp<GetAllFeaturePointsWithinBoundsResponseData> resp = await _backend.getAllFeaturePointsWithinBounds(sessionState, bounds.center, bounds.radius * 1000);
    if (resp.isData()) {
      _prevFetchFeaturePoints = resp.asData().featurePoints.map((FeaturePointData fpd) => FeaturePoint.synced(fpd)).toList();
      return _prevFetchFeaturePoints;
    } else {
      return [];
    }
  }

  /// Manually clear the cache to force a fresh fetch
  void clear() {
    _prevFetchBounds = null;
    notifyListeners();
  }
}