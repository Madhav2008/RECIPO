import 'package:flutter/material.dart';

class TextInputOpacity extends StatelessWidget {
  const TextInputOpacity({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(25.0)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
          prefixIcon: icon,
          hintText: '$title',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          fillColor: Colors.white,
          focusColor: Colors.white,
        ),
      ),
    );
  }
}
