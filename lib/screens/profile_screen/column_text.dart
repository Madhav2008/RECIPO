import 'package:flutter/material.dart';

class ColumnText extends StatelessWidget {
  const ColumnText({
    Key key,
    this.title,
    this.count,
  }) : super(key: key);
  final String title, count;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "$count",
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 20.0,
        ),
      ),
      SizedBox(height: 5.0),
      Text(
        "$title",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ]);
  }
}