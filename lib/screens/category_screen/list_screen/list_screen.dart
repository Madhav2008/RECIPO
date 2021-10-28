import 'package:Foodybite/models/category.dart';
import 'package:Foodybite/screens/category_screen/widgets/custom_app_bar.dart';
import 'package:Foodybite/screens/category_screen/widgets/trend_card.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key, this.category}) : super(key: key);
  final Category category;
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            image: widget.category.imageUrl,
            color1: widget.category.color1,
            color2: widget.category.color2,
            title: widget.category.name,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 20.0,
                      ),
                      child: TrendCard(
                          rate: '🌟 4.5',
                          title: 'Happy Bones',
                          isOpen: 'OPEN',
                          category: 'Italian',
                          image: 'assets/images/Login.png',
                          address: '394 Broome St, New York, NY 10013, USA',
                          distance: '12 km',
                          size: MediaQuery.of(context).size.width * 0.91,
                          onPress: () {
                            Navigator.pushNamed(context, '/DetailScreen');
                          }),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}