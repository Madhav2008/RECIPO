import 'package:Foodybite/models/category.dart';
import 'package:Foodybite/screens/category_screen/category_list_screen/category_list_screen.dart';
import 'package:Foodybite/screens/category_screen/list_screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Category',
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 138, 110, 1),
              Color.fromRGBO(255, 63, 111, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: category.length,
          itemBuilder: (BuildContext context, int index) {
            Category cate = category[index];
            return CategoryList(
              title: cate.name,
              color1: cate.color1,
              color2: cate.color2,
              image: cate.imageUrl,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ListScreen(
                      category: cate,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}