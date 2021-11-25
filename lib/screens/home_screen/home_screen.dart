import 'package:Foodybite/screens/detail_screen/detail_screen.dart';
import 'package:Foodybite/screens/post_recipe_screen/models/database.dart';
import 'package:Foodybite/screens/search_screen/search_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
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
      child:
          // StreamBuilder(
          // stream: Connectivity().onConnectivityChanged,
          // builder:
          //     (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
          //   if (snapshot != null &&
          //       snapshot.hasData &&
          //       snapshot.data != ConnectivityResult.none) {
          //     return
          Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.redAccent,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.network(
              "https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Logo3Recipo.png",
              width: 110,
              height: 110,
            ),
          ),
          centerTitle: true,
          bottom: _buildBottomBar(),
          // actions: [
          //   GestureDetector(
          //     onTap: () {
          //       showAboutDialog(
          //         context: context,
          //         applicationName: 'Recipo',
          //         applicationVersion: 'by Madhav Arora\n\nV1.0',
          //       );
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.only(right: 15),
          //       child: Icon(
          //         Icons.info_outline_rounded,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: _buildListView(context),
      ),
    );
    // } else {
    //   return Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               // Icon(Icons.favorite),
    //               // SizedBox(width:5),
    //               Image.asset('assets/images/no-internet.png',
    //                   width: 110, height: 110),
    //               // SizedBox(width:5),
    //               // Icon(Icons.favorite),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               // Icon(Icons.wifi_off),
    //               // SizedBox(width:5),
    //               Text(
    //                 "No Internet Access",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold, fontSize: 25),
    //               ),
    //               // SizedBox(width:5),
    //               // Icon(Icons.wifi_off),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    // },
    // ),
    // );
  }

  PreferredSize _buildBottomBar() {
    return PreferredSize(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: Container(
            child: TextField(
                controller: searchController,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Recipe',
                  icon: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => SearchScreen(
                              searchText: searchController.text)));
                    },
                    icon: Icon(Icons.search),
                    color: Colors.red,
                  ),
                  // suffixIcon: IconButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => SearchScreen(
                  //                   searchText: searchController.text)));
                  //     },
                  //     icon: Icon(Icons.search),
                  //     color: Colors.red
                )),
          ),
        ),
      ),
      // ),
      preferredSize: Size.fromHeight(80.0),
    );
  }

  Widget _buildListView(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(226, 55, 68, 0.60),
              Color.fromRGBO(226, 55, 68, 0.60),
              Color.fromRGBO(226, 55, 68, 0.60),
              Color.fromRGBO(226, 55, 68, 0.60),
            ])),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Recent Recipes",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )),
              // Spacer(),
              // Builder(
              //     builder: (BuildContext context) =>
              //         Text(
              //           "View All",
              //           style: TextStyle(
              //               fontSize: 14,
              //               color: Colors.black),
              //         )),
            ],
          ),
        ),
        _buildShopItem()
      ],
    );
  }

  Widget _buildShopItem() {
    return SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: RecipeDatabase.readAllRecipes(userId),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent)),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 70.0),
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
                      height: 250,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(document["image"]),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Text(document["time_to_cook"],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                          height: 1.5))
                                ],
                              ),
                              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
            }));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height - 53);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 14);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
