import 'package:Foodybite/screens/category_screen/widgets/trend_card.dart';
import 'package:flutter/material.dart';

class TrendingCarousel extends StatelessWidget {
  const TrendingCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: recipe.length,
        itemBuilder: (BuildContext context, int index) {
          // Recipes recipe = recipe[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: TrendCard(
                // rate: '🌟' + recipe.rate,
                // title: recipe.name,
                // isOpen: recipe.isOpen,
                // category: recipe.type,
                // image: recipe.imageUrl,
                // address: recipe.address,
                // distance: recipe.distance + ' km',
                // size: MediaQuery.of(context).size.width * 0.8,
                // onPress: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => DetailScreen(
                //         recipe: recipe,
                //       ),
                //     ),
                //   );
                // }
          ),
          );
        },
      ),
    );
  }
}