import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({Key key}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
   final double size = 40;
   return LikeButton();
  }
}
