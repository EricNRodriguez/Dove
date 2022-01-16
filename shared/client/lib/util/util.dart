import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef void ConsumerFn<T>(T value);
typedef T GetterFn<T>();
typedef void Runnable();
typedef Future<void> AsyncRunnable();

List<T> filterNulls<T>(List<T?> items) {
  return items.where((e) => e != null).map((e) => e!).toList();
}

double calculateDistanceKm(LatLng p1, LatLng p2){
  var p = 0.017453292519943295;
  var a = 0.5 - cos((p2.latitude - p1.latitude) * p)/2 +
      cos(p1.latitude * p) * cos(p2.latitude * p) *
          (1 - cos((p2.longitude - p1.longitude) * p))/2;
  return 12742 * asin(sqrt(a));
}