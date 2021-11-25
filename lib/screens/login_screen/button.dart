import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonText;

  Buttons({required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.redAccent,
            Color.fromRGBO(226, 55, 68, 1.0),
            Color.fromRGBO(226, 55, 68, 0.80),
            Color.fromRGBO(226, 55, 68, 0.60),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.3,
          ),
        ),
      ),
    );
  }
}