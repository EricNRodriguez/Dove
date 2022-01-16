import 'package:flutter/material.dart';

class Carousel<T> extends StatelessWidget {

  final List<T> items;
  final double itemSeparation;
  final Function(BuildContext context, dynamic item) builderFunction;
  final double height;

  Carousel({
    Key? key,
    required this.items,
    required this.builderFunction,
    required this.height,
    this.itemSeparation = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.separated(
          physics: PageScrollPhysics(),
          separatorBuilder: (context, index) => Divider(
            indent: itemSeparation,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            Widget item = builderFunction(context, items[index]);
            return item;
          }),
    );
  }
}