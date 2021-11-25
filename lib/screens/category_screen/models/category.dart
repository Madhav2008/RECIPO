import 'package:flutter/material.dart';

class Category {
  String? name;
  String? imageUrl;
  Color? color1;
  Color? color2;

  Category({
    this.name,
    this.imageUrl,
    this.color1,
    this.color2,
  });
}

final List<Category> category = [
  Category(
      imageUrl: 'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Italian%20food.jpg',
      name: 'Italian',
      color1: Colors.pink,
      color2: Colors.yellow
  ),
  Category(
      imageUrl: 'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/punjabi-food-1200x900-1.jpg',
      name: 'Punjabi',
      color1: Colors.lightBlue,
      color2: Colors.purple
  ),
  Category(
      imageUrl: 'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/indo-chinese-food.jpg',
      name: 'Chinese',
      color1: Colors.pink,
      color2: Colors.purple
  ),
  Category(
      imageUrl: 'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Delights-From-The-Land-Of-Gujarat-870x635.jpg',
      name: 'Gujarati',
      color1: Colors.orange,
      color2: Colors.pink
  ),
  Category(
      imageUrl: 'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Bengali-Food-Etiquette-.png',
      name: 'Bengali',
      color1: Colors.lightBlue,
      color2: Colors.tealAccent
  ),
];