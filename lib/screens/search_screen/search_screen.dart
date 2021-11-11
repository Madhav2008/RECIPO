import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSeaching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSeaching? Text('Search Recipe'):TextField(decoration: InputDecoration(icon:Icon(Icons.search_sharp),hintText: "Search Recipe")),
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