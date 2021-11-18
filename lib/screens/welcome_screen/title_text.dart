import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key key,
    this.size,
    this.index,
    this.name,
  }) : super(key: key);

  final Size size;
  final int index;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: size.width * 0.055,
      ),
    );
  }
}