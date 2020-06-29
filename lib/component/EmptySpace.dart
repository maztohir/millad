import 'package:flutter/material.dart';

class EmptySpace extends StatelessWidget {
  final width, height;

  EmptySpace({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    if (width != null && height != null) {
      return Container(
        width: width,
        height: height,
      );
    } else if (width != null) {
      return Padding(
        padding: EdgeInsets.only(left: width),
      );
    } else if (height != null) {
      return Padding(
        padding: EdgeInsets.only(top: height),
      );
    } else {
      return Expanded(
        child: Padding(padding: EdgeInsets.all(0.0)),
      );
    }
  }
}
