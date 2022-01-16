import 'package:client/model/SessionState.dart';
import 'package:client/model/feature_point.dart';
import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:client/page/feature_point_detail_screen.dart';
import 'package:client/util/util.dart';
import 'package:flutter/material.dart';

import '../widget/alert_dialog.dart';
import '../model/backend.dart';
import '../widget/carousel.dart';
import '../widget/image_widget.dart';

class FeaturePointModalSheet extends StatefulWidget {
  final SessionState _sessionState;
  final FeaturePoint _featurePoint;
  final Backend _backend;
  final ConsumerFn<FeaturePoint> _editFeaturePoint;

  FeaturePointModalSheet(this._sessionState, this._featurePoint, this._backend, this._editFeaturePoint);

  @override
  _FeaturePointModalSheetState createState() => _FeaturePointModalSheetState();
}

class _FeaturePointModalSheetState extends State<FeaturePointModalSheet> {

  UserData _featurePointOwner = UserData.create();

  @override
  void initState() {
    super.initState();
    widget._backend.getUserById(widget._sessionState, widget._featurePoint.raw.ownerId.toInt()).then(
            (resp) async {
              if (resp.isData()) {
                setState(() {
                  _featurePointOwner = resp.asData().user;
                });
              } else {
                await alertDialog(context, title: 'An error has occurred', message: 'The feature point was unable to be retrieved, please try again.');
                Navigator.pop(context);
              }
            }
    );
  }

  Widget? _getEditIcon() {
    if (widget._sessionState.user.userId != widget._featurePoint.raw.ownerId.toInt()) {
      return null;
    }

    return IconButton(
        onPressed: () {
          Navigator.pop(context, null);
          widget._editFeaturePoint(widget._featurePoint);
        },
        icon: Icon(Icons.edit),
    );
  }

  List<Widget> _getImageWidgets() {
    return widget._featurePoint.raw.images
        .map((FeaturePointImageData featurePointImageData) => featurePointImageData.image)
        .map((NetworkImageData imgData) {
          return ImageWidget(
            aspectRatio: 1,
            height: 210,
            radius: 10,
            image: widget._backend.getImage(
              widget._sessionState,
              imgData.localPath,
              defaultImage: Image.asset('images/default_profile.jpg'),
            ),
          );
        }).toList();
  }

  Widget _imageCarousel() {
    return Carousel<Widget>(
      height: 210,
      items: _getImageWidgets(),
      builderFunction: (context, item) {
        return item;
      },
    );
  }

  void _openDetailsScreen() async {
    Route<void> route = PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FeaturePointDetailScreen(
          widget._sessionState,
          widget._backend,
          widget._featurePoint,
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

    await Navigator.push<void>(
      context,
      route,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              leading: Container(
              width: 45,
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: widget._backend.getImage(
                    widget._sessionState,
                    _featurePointOwner.profileImage.localPath,
                    defaultImage: Image.asset('images/default_profile.jpg'),
                  ),
                ),
              ),
            ),
            title: Text('${_featurePointOwner.username}'),
            trailing: _getEditIcon(),
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    '${widget._featurePoint.raw.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Lucida',
                      color: Colors.black,
                    ),
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                ),
                Container(
                  child: Text(
                    '(${widget._featurePoint.raw.location.longitude}, ${widget._featurePoint.raw.location.latitude})',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 11,
                      fontFamily: 'Lucida',
                      color: Colors.black,
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 15),
                ),
                Container(
                  child: _imageCarousel(),
                ),
              ],
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              title: Text('Details'),
              trailing: Icon(Icons.arrow_right_sharp),
              onTap: _openDetailsScreen,
            ),
          ),
        ],
      )
    );
  }
}
