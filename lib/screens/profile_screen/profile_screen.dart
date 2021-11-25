import 'dart:convert';

import 'package:Foodybite/auth/auth_services.dart';
import 'package:Foodybite/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:Foodybite/screens/login_screen/login_screen.dart';
import 'package:Foodybite/screens/post_recipe_screen/models/database.dart';
import 'package:Foodybite/screens/post_recipe_screen/models/users.dart';
import 'package:Foodybite/screens/profile_screen/tab_1.dart';
import 'package:Foodybite/screens/profile_screen/tab_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final recipeSnapshot = RecipeDatabase.readUserRecipes(userId);
    final authService = Provider.of<AuthService>(context);
    final db = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("userDetails");
    return FutureBuilder<QuerySnapshot>(
        future: db.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)
              ),
            );
          }
          final data = snapshot.data!.docs[0];
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
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.redAccent,
                  elevation: 1,
                  automaticallyImplyLeading: false,
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'MuseoModerno',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () async {
                        authService.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      // icon: Icon(Icons.logout_sharp),
                      icon: Icon(Icons.power_settings_new_rounded),
                      color: Colors.white,
                    )
                    // color: Colors.white,
                    // )
                  ],
                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 70
                            )
                            // backgroundImage: NetworkImage(
                              // data['imageUrl'],
                            // ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 20),
                                  child: Row(
                                    // mainAxisAlignment:
                                        // MainAxisAlignment.spaceEvenly,
                                    // mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        // alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: [
                                            Container(
                                              // alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                                              child: Text(
                                                data['userName'],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              // mainAxisAlignment:
                                              // MainAxisAlignment.center,
                                              children: [
                                                Text('---'),
                                                SizedBox(width: 5),
                                                Text(
                                                  data['bio'],
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(width: 5),
                                                Text('---'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // child: Text(
                                        //   data['bio'],
                                        //   style: TextStyle(
                                        //     fontSize: 14,
                                        //   ),
                                        // ),
                                      ),
                                      // buildCountColumn('Posts - ', 0),
                                      // buildCountColumn('Followers', 0),
                                      // buildCountColumn('Following', 0),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  // child: Container(
                                  //   width: 250,
                                  //   child: RaisedButton(
                                  //     color: Colors.white,
                                  //
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //     ),
                                  //     onPressed: () async {
                                  //       Navigator.push(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //               builder: (context) =>
                                  //                   EditProfile()));
                                  //     },
                                  //     // },
                                  //     child: Text("Edit Profile"),
                                  //     // color: Colors.red,
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Center(
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   padding: const EdgeInsets.only(top: 2, left: 2),
                      //   child: Text(
                      //     data['bio'],
                      //     style: TextStyle(
                      //       fontSize: 12,
                      //     ),
                      //   ),
                      // ),

                      Expanded(
                          child: Column(
                        children: [
                          TabBar(
                            indicatorColor: Colors.redAccent,
                            tabs: [
                              Tab(
                                icon: Icon(Icons.grid_3x3, color: Colors.red),
                              ),
                              Tab(
                                icon: Icon(Icons.favorite, color: Colors.red),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                FirstTab(),
                                SecondTab(),
                              ],
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  buildCountColumn(String label, int count) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                ),
              ))
        ]);
  }
}
