import 'package:Foodybite/models/category.dart';
import 'package:Foodybite/widgets/food_category.dart';
import 'package:flutter/material.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          Category cate = category[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 10.0,
              right: 5.0,
            ),
            child: FoodCategory(
              title: cate.name,
              image: cate.imageUrl,
              color1: cate.color1,
              color2: cate.color2,
            ),
          );
        },
      ),
    );
  }
}
