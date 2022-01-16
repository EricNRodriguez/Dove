import 'package:client/util/util.dart';
import 'package:flutter/material.dart';


class ImageWidget extends StatelessWidget {
  final Widget image;
  final double aspectRatio;
  final double? height;
  final double? radius;
  final Runnable? onDelete;

  ImageWidget({
    required this.image,
    required this.aspectRatio,
    this.height,
    this.radius,
    this.onDelete,
  });


  Widget _buildImage() {

    return Container(
      height: height,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            radius != null ? Radius.circular(radius!) : Radius.zero,
          ),
          child: AspectRatio(
            child: image,
            aspectRatio: aspectRatio,
          ),
        ),
      ),
    );
  }

  Widget? _deleteButton() {
    if (onDelete == null) {
      return null;
    }

    return Positioned(
      top: 0,
      right: 0,
      child: GestureDetector(
        onTap: onDelete,
        child: Icon(
          Icons.cancel_outlined,
          color: Colors.red,
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: filterNulls(<Widget?>[
        _buildImage(),
        _deleteButton(),
      ]),
    );
  }
}