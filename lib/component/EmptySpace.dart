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
      return Container(width: width);
    } else if (height != null) {
      return Container(height: height);
    } else {
      return Expanded(flex: 1, child: Container());
    }
  }
}
