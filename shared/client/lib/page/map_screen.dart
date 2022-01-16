import 'dart:async';

import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:client/widget/alert_dialog.dart';
import 'package:client/model/bounds.dart';
import 'package:client/model/feature_point.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/SessionState.dart';
import '../model/backend.dart';
import 'feature_point_edit_screen.dart';
import 'feature_point_modal_sheet.dart';
import '../model/feature_point_store.dart';

class MapScreen extends StatefulWidget {
  final SessionState _sessionState;
  final Backend _backend;
  final FeaturePointCache _featurePointCache;

  MapScreen(this._sessionState, this._featurePointCache, this._backend);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Completer<GoogleMapController> _mapController = Completer();
  FeaturePointId? _focusedPoint;

  static const LatLng _center = const LatLng(45.5215633, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  Future<void> _createNewFeaturePoint(LatLng tapPosition) async {
    HttpResp<NewFeaturePointResponseData> newFeaturePointResp = await widget._backend.createFeaturePoint(widget._sessionState, NewFeaturePointRequestData(
      location: LocationData(
        latitude: tapPosition.latitude,
        longitude: tapPosition.longitude,
      ),
    ));

    if (newFeaturePointResp.isData()) {
      bool editSuccessful = await _editFeaturePoint(FeaturePoint.synced(newFeaturePointResp.asData().featurePoint));
      if (!editSuccessful) {
        await widget._backend.deleteFeaturePoint(widget._sessionState, newFeaturePointResp.asData().featurePoint.featurePointId.toInt());
      } else {
        widget._featurePointCache.clear();
      }
    } else {
      alertDialog(context, title: 'An error has occurred', message: 'The feature point was not successfully created, please try again.');
      return;
    }
  }

  Future<Set<Marker>> _buildMarkers() async {
    List<FeaturePoint> featurePoints = await _fetchFeaturePoints();
    return featurePoints.map((e) {
     return Marker.new(
        markerId: MarkerId(e.raw.toString()),
        position: e.getLatLng(),
        onTap: () {
          _viewFeaturePoint(e);
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(e.raw.featurePointId == _focusedPoint ? BitmapDescriptor.hueAzure : BitmapDescriptor.hueRed),
      );
    }).toSet();

  }

  void _alignCameraToPoint(LatLng point) async {
    GoogleMapController mapController = await _mapController.future;
    ScreenCoordinate screenPosition = await mapController.getScreenCoordinate(point);

    Size screenSize = MediaQuery.of(context).size;

    double desiredCenterDistanceBelowMarker = screenSize.height / 2;

    ScreenCoordinate targetMapCenterCoordinate = ScreenCoordinate(
      x: screenPosition.x.toInt(),
      y: screenPosition.y + desiredCenterDistanceBelowMarker.toInt(),
    );

    LatLng targetMapCenterLatLng = await mapController.getLatLng(targetMapCenterCoordinate);
    mapController.animateCamera(CameraUpdate.newLatLng(targetMapCenterLatLng));
  }

  void _setFocusedFeaturePoint(FeaturePointId? featurePointId) {
    setState(() {
      _focusedPoint = featurePointId;
    });
  }

  Future<bool> _editFeaturePoint(FeaturePoint featurePoint) async {
    Route<bool> route = PageRouteBuilder<bool>(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FeaturePointEditScreen(
          widget._sessionState,
          widget._backend,
          featurePoint,
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );

    bool? shouldSaveTemplate = await Navigator.push<bool>(
      context,
      route,
    );

    return shouldSaveTemplate ?? false;
  }

  Future<void> _viewFeaturePoint(FeaturePoint featurePoint) async {

    _setFocusedFeaturePoint(featurePoint.raw.featurePointId.toInt());

    _alignCameraToPoint(featurePoint.getLatLng());
    await showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
      ),
      builder: (BuildContext context) {
        return Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          child: Container(
            height: MediaQuery.of(context).size.height / 2 +
                MediaQuery.of(context).viewInsets.bottom,
            child: Column(
              children: <Widget>[
                FeaturePointModalSheet(
                        widget._sessionState,
                        featurePoint,
                        widget._backend,
                        (featurePoint) async {
                          await _editFeaturePoint(featurePoint);
                          widget._featurePointCache.clear();
                        },
                )
              ],
            ),
          ),
        );
      },
    );

    _setFocusedFeaturePoint(null);
  }

  Future<List<FeaturePoint>> _fetchFeaturePoints() async {
    GoogleMapController mapController = await _mapController.future;
    LatLngBounds bounds = await mapController.getVisibleRegion();
    return await widget._featurePointCache.getFeaturePoints(widget._sessionState, bounds: CircularBounds.fromLatLng(bounds));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<Marker>>(
        initialData: null,
        future: _buildMarkers(),
        builder: (context, markersSnapshot) {
          Set<Marker> markers = const <Marker>[].toSet();
          if (markersSnapshot.hasData) {
            markers = markersSnapshot.data!;
          }

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GoogleMap(
              mapType: MapType.satellite,
              // zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              onLongPress: (LatLng tapPos) {
                _createNewFeaturePoint(tapPos);
              },
              onCameraIdle: _fetchFeaturePoints,
              markers: markers,
            ),
          );
        }
    );
  }
}