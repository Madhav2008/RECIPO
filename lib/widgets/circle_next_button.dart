import 'package:flutter/material.dart';

class CircleNextButton extends StatelessWidget {
  const CircleNextButton({
    Key key,
    this.onPress,
  }) : super(key: key);
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          onPress();
        },
        icon: Icon(
          Icons.arrow_right_alt_outlined,
          size: 45.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
