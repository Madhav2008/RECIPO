import 'package:Foodybite/widgets/card.dart';
import 'package:Foodybite/widgets/search.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Recipes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Search(
              title: 'Search',
              icon: Icon(
                Icons.search,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: StyleCard(
                          rate: '10',
                          title: 'Happy Bones',
                          isOpen: 'OPEN',
                          category: 'Italian',
                          image: "assets/images/Register.png",
                          about: 'Lorem Ipsum is simply dummy text',
                          size: MediaQuery.of(context).size.width * 0.91,
                          onPress: ()async{
                            Navigator.pushNamed(context, '/DetailScreen');
                          }),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
