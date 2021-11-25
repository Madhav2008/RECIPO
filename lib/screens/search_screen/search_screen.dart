import 'package:Foodybite/screens/detail_screen/detail_screen.dart';
import 'package:Foodybite/screens/post_recipe_screen/models/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String? searchText;

  const SearchScreen({Key? key, this.searchText}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // bool isSeaching = false;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you really want to exit the app'),
                  actions: [
                    new ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pop(willLeave = true),
                      child: Text("Yes"),
                    ),
                    SizedBox(height: 16),
                    new FlatButton(
                      onPressed: () =>
                          Navigator.of(context).pop(willLeave = false),
                      child: Text("No"),
                    ),
                  ],
                ));
        return willLeave;
      },
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.redAccent,
              title: Text('Search'),
          ),
          body: SafeArea(
              child: StreamBuilder<QuerySnapshot>(
                  stream: RecipeDatabase.readSearchRecipes(
                       widget.searchText.toString()),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.redAccent)),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ListView(
                          children: snapshot.data!.docs.map((document) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(document: document)));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            margin: EdgeInsets.only(bottom: 20.0),
                            height: 300,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(document["image"]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(5.0, 5.0),
                                            blurRadius: 10.0)
                                      ]),
                                )),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          document["title"],
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(document["category"],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18.0)),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(document['time_to_cook'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            )),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        top: 20.0, bottom: 20.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(5.0, 5.0),
                                              blurRadius: 10.0)
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                    );
                  }))),
    );
  }
}