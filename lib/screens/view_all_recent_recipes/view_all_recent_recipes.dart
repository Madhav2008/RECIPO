import 'package:Foodybite/widgets/card.dart';
import 'package:Foodybite/widgets/search.dart';
import 'package:flutter/material.dart';

class ViewAllRecentRecipesScreen extends StatelessWidget {
  const ViewAllRecentRecipesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Recipes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                        image: 'assets/images/Login.png',
                        about: 'Lorem Ipsum is simply dummy text',
                        size: MediaQuery.of(context).size.width * 0.91,
                        onPress: (){
                          Navigator.pushNamed(context, '/DetailScreen');
                        },
                      ),
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