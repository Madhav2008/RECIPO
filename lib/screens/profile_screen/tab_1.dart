import 'package:Foodybite/screens/detail_screen/detail_screen.dart';
import 'package:Foodybite/screens/post_recipe_screen/models/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: RecipeDatabase.readUserRecipes(userId),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)),
            );
          }
          return GridView.count(
              crossAxisCount: 3,
              children: snapshot.data!.docs.reversed
                  .map((document) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          child: Expanded(
                            child: Hero(
                              child: Container(
                                color: Colors.white,
                                child: ClipRRect(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                      document: document)));
                                    },
                                    child: Image.network(
                                      document['image'],
                                      fit: BoxFit.cover,
                                      // width: 100,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  // ),
                                ),
                              ),
                              tag: document['image'],
                            ),
                          ),
                        ),
                      ))
                  .toList());
        });
  }
}
