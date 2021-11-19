import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key key,
    this.title,
    this.onPress,
    this.color1,
    this.color2,
  }) : super(key: key);
  final String title;
  final Function onPress;
  final Color color1, color2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: color1,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                spreadRadius: -2,
              )
            ]),
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
              color: color2,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
