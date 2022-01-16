import 'package:client/model/SessionState.dart';
import 'package:client/model/backend.dart';
import 'package:client/util/util.dart';
import 'package:flutter/material.dart';

import 'image_widget.dart';

class ProfileImageWidget extends StatelessWidget {
  final SessionState _sessionState;
  final Backend _backend;
  final Runnable _uploadNewProfileImage;
  final double? _height;

  ProfileImageWidget({
    required SessionState sessionState,
    required Backend backend,
    required Runnable uploadNewProfileImage,
    double? height,
  }):
        this._sessionState = sessionState,
        this._backend = backend,
        this._uploadNewProfileImage = uploadNewProfileImage,
        this._height = height;

  Widget buildImage() {
    return ImageWidget(
      radius: (_height ?? 0.0) / 2,
      image: getImage(),
      aspectRatio: 1,
    );
  }

  Widget getImage() {
    if (_sessionState.user.profileImage.localPath.isEmpty) {
      return Image.asset('images/default_profile.jpg');
    } else {
      return _backend.getImage(
        _sessionState,
        _sessionState.user.profileImage.localPath,
      );
    }
  }

  Widget buildEditIcon(Color color) {
    return GestureDetector(
        child: buildCircle(
          color: Colors.white,
          all: 3,
          child: buildCircle(
            color: color,
            all: 8,
            child: Icon(
              Icons.add_a_photo,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        onTap: _uploadNewProfileImage
    );
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: Center(
        child: Stack(
          children: [
            buildImage(),
            Positioned(
              bottom: 0,
              right: 4,
              child: buildEditIcon(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}