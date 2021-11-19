import 'package:flutter/material.dart';

class RowTitleCraousel extends StatelessWidget {
  const RowTitleCraousel({
    Key key,
    this.title,
    this.count,
    this.onPress,
  }) : super(key: key);
  final String title;
  final int count;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$title',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            'See all($count)',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
