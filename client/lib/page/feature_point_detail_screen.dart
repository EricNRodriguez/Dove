import 'package:client/model/backend.dart';
import 'package:client/model/gencode/message_schema.pbserver.dart';
import 'package:client/widget/carousel.dart';
import 'package:client/widget/image_widget.dart';
import 'package:client/util/util.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';

import '../model/SessionState.dart';
import '../model/feature_point.dart';

class FeaturePointDetailScreen extends StatefulWidget {
  final SessionState _sessionState;
  final FeaturePoint _featurePoint;
  final Backend _backend;

  FeaturePointDetailScreen(this._sessionState, this._backend, this._featurePoint);

  @override
  _FeaturePointDetailScreenState createState() => _FeaturePointDetailScreenState();
}

class _FeaturePointDetailScreenState extends State<FeaturePointDetailScreen> {

  Address? _address;

  @override
  void initState() {
    super.initState();
    _getLocationDetails().then((value) => setState((){
      _address = value;
    }));
  }

  List<Widget> _getImages() {
    return widget._featurePoint.raw.images
        .map((FeaturePointImageData featurePointImageData) => featurePointImageData.image)
        .map((NetworkImageData imgData) {
          return ImageWidget(
            aspectRatio: 1,
            height: 200,
            radius: 10,
            image: widget._backend.getImage(
                widget._sessionState,
                imgData.localPath,
            ),
          );
        }).toList();
  }

  Future<Address> _getLocationDetails() async {
    GeoCode geoCode = GeoCode();
    Address address  = await geoCode.reverseGeocoding(
        latitude: widget._featurePoint.raw.location.latitude,
        longitude: widget._featurePoint.raw.location.longitude,
    );

    return address;
  }

  Widget? _category({
    required String title,
    required Icon icon,
    required Widget? widget,
  }) {
    if (widget == null) {
      return null;
    }

    return Card(
      child: ExpansionTile(
        maintainState: true,
        leading: icon,
        title: new Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 15),
            child: widget,
          ),
        ],
      ),
    );
  }

  Widget? _imageCarousel() {
    if (widget._featurePoint.raw.images.isEmpty) {
      return null;
    }

    return Carousel<Widget>(
      height: 200,
      items: _getImages(),
      builderFunction: (context, item) {
        return item;
      },
    );
  }

  Widget? _description() {
    if (widget._featurePoint.raw.description.isEmpty) {
      return null;
    }
    return _centerLeftAlignment(
      _bodyText(widget._featurePoint.raw.description),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
          widget._featurePoint.raw.title,
        ),
      );
  }

  Widget _centerLeftAlignment(Widget widget) {
    return Container(
      alignment: Alignment.centerLeft,
      child: widget,
    );
  }

  Widget _location() {
    return _centerLeftAlignment(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _bodyText(_address?.streetAddress ?? ''),
          _bodyText(_address?.city ?? ''),
          _bodyText(_address?.countryName ?? ''),
          _bodyText(_address?.postal ?? ''),
        ],
      ),
    );
  }

  Widget _bodyText(String? text) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Scrollbar(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: filterNulls(<Widget?>[
              _category(
                title: 'Location',
                icon: Icon(Icons.location_pin),
                widget: _location(),
              ),
              _category(
                  title: 'Photos',
                  icon: Icon(Icons.camera),
                  widget: _imageCarousel(),
              ),
              _category(
                title: 'Description',
                icon: Icon(Icons.description),
                widget: _description(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}