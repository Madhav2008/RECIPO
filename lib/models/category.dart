import 'package:flutter/material.dart';

class Category {
  String name;
  String imageUrl;
  Color color1;
  Color color2;

  Category({
    this.name,
    this.imageUrl,
    this.color1,
    this.color2,
  });
}

final List<Category> category = [
  Category(
      imageUrl: 'assets/images/Login.png',
      name: 'Italian',
      color1: Colors.pink,
      color2: Colors.yellow
  ),
  Category(
      imageUrl: 'assets/images/Welcome.png',
      name: 'Maxican',
      color1: Colors.lightBlue,
      color2: Colors.purple
  ),
  Category(
      imageUrl: 'assets/images/Register.png',
      name: 'Chinese',
      color1: Colors.pink,
      color2: Colors.purple
  ),
  Category(
      imageUrl: 'assets/images/cook.png',
      name: 'Arabian',
      color1: Colors.orange,
      color2: Colors.pink
  ),
  Category(
      imageUrl: 'assets/images/serve.png',
      name: 'Thai',
      color1: Colors.lightBlue,
      color2: Colors.tealAccent
  ),
];