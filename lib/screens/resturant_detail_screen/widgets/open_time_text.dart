import 'package:flutter/material.dart';

class OpenTimeText extends StatelessWidget {
  const OpenTimeText({
    Key key,
    this.isOpen,
    this.dailyTime,
  }) : super(key: key);
  final String isOpen, dailyTime;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$isOpen ',
        style: TextStyle(color: Colors.red),
        children: <TextSpan>[
          TextSpan(
            text: 'daily time ',
            style: TextStyle(color: Colors.grey[600]),
          ),
          TextSpan(
            text: '$dailyTime',
          )
        ],
      ),
    );
  }
}
