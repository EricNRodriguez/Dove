import 'package:client/util/util.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CircularBounds {
  final LatLng center;
  final double radius;

  CircularBounds.fromLatLng(LatLngBounds bounds) :
    this.center = LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2.0,
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2.0,
    ),
    this.radius =  calculateDistanceKm(bounds.northeast, bounds.southwest) / 2.0;

  CircularBounds({
    required this.center,
    required this.radius,
  });

  bool contains(CircularBounds bounds) {
    double centerDistance = calculateDistanceKm(center, bounds.center).abs();
    return radius > (centerDistance + bounds.radius);
  }

  CircularBounds grow(double scalar) {
    return CircularBounds(
        center: center,
        radius: radius * scalar,
    );
  }
}