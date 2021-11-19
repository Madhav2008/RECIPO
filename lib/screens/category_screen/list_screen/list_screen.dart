import 'package:Foodybite/models/category.dart';
import 'package:Foodybite/screens/category_screen/widgets/custom_app_bar.dart';
import 'package:Foodybite/widgets/card.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key, this.category, this.title}) : super(key: key);
  final Category category;
  final String title;

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
                        horizontal: 19.0,
                        vertical: 15.0,
                      ),
                      child: StyleCard(
                          rate: '🌟 4.5',
                          title: 'Happy Bones',
                          isOpen: 'OPEN',
                          category: widget.category.name,
                          image: widget.category.imageUrl,
                          about: 'Lorem Ipsum is simply dummy text',
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