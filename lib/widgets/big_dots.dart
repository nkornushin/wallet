import 'package:flutter/material.dart';

class BigDotsWidget extends StatelessWidget {
  const BigDotsWidget({Key key, this.width, this.height, this.color, this.count}) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final int count;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _dots = [];
    for (int i = 0; i < count; i++) {
      _dots.add(
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      );
      _dots.add(SizedBox(
        width: width / 2,
        height: height / 2,
      ));
    }

    return Row(
      children: _dots,
    );
  }
}
