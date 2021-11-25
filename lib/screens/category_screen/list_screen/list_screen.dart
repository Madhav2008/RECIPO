import 'package:Foodybite/screens/category_screen/models/category.dart';
import 'package:Foodybite/screens/detail_screen/detail_screen.dart';
import 'package:Foodybite/screens/post_recipe_screen/models/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name!),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(226, 55, 68, 0.50),
                    Color.fromRGBO(226, 55, 68, 0.30),
                    Color.fromRGBO(226, 55, 68, 0.10),
                    Color.fromRGBO(226, 55, 68, 0.30),
                    Color.fromRGBO(226, 55, 68, 0.50),
                  ])),
              alignment: Alignment.topCenter,
              child: _buildRecipes(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipes(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: RecipeDatabase.readRecipesByCategory(
                 widget.category.name!),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent)),
                );
              }
              return ListView(
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
                    margin: EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Image.network(document['image']),
                                  // Positioned(
                                  //   right: 10,
                                  //   top: 10,
                                  //   child: Icon(Icons.favorite, color: Colors.red,size: 20.0,),
                                  // ),
                                  // Positioned(
                                  //   right: 8,
                                  //   top: 8,
                                  //   child: Icon(Icons.favorite_border, color: Colors.white,size: 24.0,),
                                  // ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      document['title'],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      document['about_recipe'],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList());
            }));
  }
}
