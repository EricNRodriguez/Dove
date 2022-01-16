import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef FeaturePointId = int;

class FeaturePoint {
  final FeaturePointData raw;

  static FeaturePoint local(String title, String description, LatLng point) {
    return FeaturePoint._(FeaturePointData(
      title: title,
      description: description,
      location: LocationData(
        latitude: point.latitude,
        longitude: point.longitude,
      ),
    ));
  }

  static FeaturePoint synced(FeaturePointData featurePointData) {
    assert(featurePointData.featurePointId != 0);
    assert(featurePointData.ownerId != 0);

    return FeaturePoint._(featurePointData);
  }

  FeaturePoint._(this.raw);

  LatLng getLatLng() {
    return LatLng(
      raw.location.latitude,
      raw.location.longitude,
    );
  }
}