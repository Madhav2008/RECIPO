import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  // const SearchScreen({Key key}) : super(key: key);
  bool isSeaching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSeaching? Text('Cooking List'):Text('Search Recipe'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  this.isSeaching = !this.isSeaching;
                });
              }
              ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(4.0),
        color: CupertinoColors.extraLightBackgroundGray,
        // child: buildListView(),
      ),
    );
  }
}