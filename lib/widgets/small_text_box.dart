import 'package:flutter/material.dart';

class SmallTextBox extends StatelessWidget {
  const SmallTextBox({
    Key key,
    this.title,
    this.color,
    this.color2,
  }) : super(key: key);
  final String title;
  final Color color, color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color2,
        borderRadius: BorderRadius.circular(3.0),
      ),
      width: 50,
      height: 20,
      child: Center(
        child: Text(
          '$title',
          style: TextStyle(
            color: color,
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
