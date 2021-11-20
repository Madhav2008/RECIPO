import 'package:Foodybite/auth/auth_services.dart';
import 'package:Foodybite/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:Foodybite/screens/login_screen/login_screen.dart';
import 'package:Foodybite/screens/profile_screen/tab_1.dart';
import 'package:Foodybite/screens/profile_screen/tab_2.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: GradientText(
            "Profile",
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'MuseoModerno',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                authService.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              // icon: Icon(Icons.logout_sharp),
              icon: Icon(Icons.power_settings_new_rounded), color: Colors.white,)
              // color: Colors.white,
            // )
          ],
        ),
        // appBar: AppBar(
        //   title: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 140),
        //     child: Text('Profile', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Container(
            //     color: Color.fromRGBO(226, 55, 68, 0.20),
            //     padding: EdgeInsets.only(top: 10,bottom: 10),
            //     child:Column(
            //         children:[
            //           Container(
            //             height: 120,
            //             width: 120,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.grey[200],
            //             ),
            //           ),
            //
            //           // username
            //           Padding(
            //             padding: const EdgeInsets.all(20.0),
            //             child: Text(
            //               '@aroramadhav65',
            //               style: TextStyle(color: Colors.black, fontSize: 20),
            //             ),
            //           ),
            //
            //           // number of following, followers, likes
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Expanded(
            //                 child: Container(
            //                   alignment: Alignment.centerRight,
            //                   child: Column(
            //                     children: [
            //                       Text(
            //                         '37',
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 24),
            //                       ),
            //                       SizedBox(
            //                         height: 5,
            //                       ),
            //                       Text(
            //                         'Following',
            //                         style: TextStyle(color: Colors.grey, fontSize: 15),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Expanded(
            //                 child: Container(
            //                   child: Column(
            //                     children: [
            //                       Text(
            //                         '8',
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 24),
            //                       ),
            //                       SizedBox(
            //                         height: 5,
            //                       ),
            //                       Text(
            //                         'Followers',
            //                         style: TextStyle(color: Colors.grey, fontSize: 15),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Expanded(
            //                 child: Container(
            //                   alignment: Alignment.centerLeft,
            //                   child: Column(
            //                     children: [
            //                       Text(
            //                         '56',
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 24),
            //                       ),
            //                       SizedBox(
            //                         height: 5,
            //                       ),
            //                       Text(
            //                         '  Likes  ',
            //                         style: TextStyle(color: Colors.grey, fontSize: 15),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //
            //           SizedBox(height: 15),
            //
            //           // buttons -> edit profile, insta links, bookmark
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //
            //                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            //                 child: Text('Edit profile',
            //                     style: TextStyle(color: Colors.black, fontSize: 20)
            //                 ),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: Colors.black45),
            //                     borderRadius: BorderRadius.circular(5)
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(horizontal: 4.0),
            //                 child: Container(
            //                   padding: EdgeInsets.all(15),
            //                   child: Icon(
            //                     Icons.camera_alt,
            //                     color: Colors.grey[800],
            //                   ),
            //                   decoration: BoxDecoration(
            //                       border: Border.all(color: Colors.black45),
            //                       borderRadius: BorderRadius.circular(5)),
            //                 ),
            //               ),
            //               Container(
            //                 padding: EdgeInsets.all(15),
            //                 child: Icon(
            //                   Icons.bookmark_border,
            //                   color: Colors.grey[800],
            //                 ),
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: Colors.black45),
            //                     borderRadius: BorderRadius.circular(5)),
            //               ),
            //             ],
            //           ),
            //           SizedBox(height: 15),
            //           Container(
            //             margin: EdgeInsets.symmetric(horizontal: 48),
            //             width: double.infinity,
            //             padding: EdgeInsets.all(15),
            //             child: Center(
            //               child: Text(
            //                 '🖋 Your Bio 🖋',
            //                 style: TextStyle(color: Colors.grey[700]),
            //               ),
            //             ),
            //             decoration: BoxDecoration(
            //                 border: Border.all(color: Colors.black45),
            //                 borderRadius: BorderRadius.circular(5)),
            //           ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 29),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        // backgroundImage: AssetImage(
                        //   "assets/images/Login.png",
                        // ),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 80
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        "Madhav Arora",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1, top: 15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "77",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26, top: 15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "452",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26, top: 15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "428",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // Center(
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Whenever you go no matter what the wheather always bring you'r own sunshine",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MaterialButton(
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                // },
                child: Text("Edit Profile"),
                // color: Colors.red,
              ),
            ),

            Expanded(
                child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.redAccent,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_3x3, color: Colors.black),
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
    );
  }
}

// import 'package:Foodybite/models/users.dart';
// import 'package:Foodybite/screens/login_screen/login_screen.dart';
// import 'package:Foodybite/auth/auth_services.dart';
// import 'package:Foodybite/widgets/simple_button.dart';
// import 'package:Foodybite/widgets/card.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'column_text.dart';
// import 'tab_1.dart';
// import 'tab_2.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final Map arguments = ModalRoute.of(context).settings.arguments as Map;
//     final authService = Provider.of<AuthService>(context);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Profile',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       body: Column(
//         children: <Widget>[
//           // SizedBox(height: 10.0),
//           Center(
//             child: CircleAvatar(
//               radius: 40.0,
//               backgroundColor: Colors.redAccent,
//               backgroundImage: AssetImage("assets/RecipoLogo.png"),
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Text(
//             "Madhav Arora",
//             style: TextStyle(
//               fontSize: 23.0,
//             ),
//           ),
//           SizedBox(
//             height: 5.0,
//           ),
//           Text(
//             "aroramadhav65@gmail.com",
//             style: TextStyle(
//               fontSize: 15.0,
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: ColumnText(
//                   title: 'Likes',
//                   count: '125k',
//                 ),
//               ),
//               Text(
//                 "|",
//                 style: TextStyle(
//                   fontSize: 45.0,
//                   color: Colors.grey[300],
//                   fontWeight: FontWeight.w100,
//                 ),
//               ),
//               Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: ColumnText(
//                       title: 'Followers', count: "10")),
//               Text(
//                 "|",
//                 style: TextStyle(
//                   fontSize: 45.0,
//                   color: Colors.grey[300],
//                   fontWeight: FontWeight.w100,
//                 ),
//               ),
//               Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: ColumnText(
//                     title: 'Following',
//                     count: "20k",
//                   )),
//             ],
//           ),
//           SizedBox(height: 10.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SimpleButton(
//                 title: 'Edit Profile',
//                 color1: Colors.redAccent,
//                 color2: Colors.white,
//               ),
//               SizedBox(width: 10.0),
//               SimpleButton(
//                 title: 'Logout',
//                 color1: Colors.redAccent,
//                 color2: Colors.white,
//                 onPress: ()async{
//                   authService.signOut();
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//                 },
//               ),
//             ],
//           ),
//           Divider(
//             // height: 35,
//             thickness: 2,
//             // indent: 20,
//             // endIndent: 20,
//           ),
//             // Expanded(
//             //     child: Column(
//             //       children: [
//             //         TabBar(
//             //           indicatorColor: Colors.redAccent,
//             //           tabs: [
//             //             Tab(
//             //               icon: Icon(Icons.grid_3x3, color: Colors.black),
//             //             ),
//             //             Tab(
//             //               icon: Icon(Icons.favorite, color: Colors.red),
//             //             ),
//             //           ],
//             //         ),
//             //
//             //         Expanded(
//             //           child: TabBarView(
//             //             children: [
//             //               FirstTab(),
//             //               SecondTab(),
//             //             ],
//             //           ),
//             //         )
//             //       ],
//             //     )
//             // ),
//           Expanded(
//             child: Container(
//               child: ListView.builder(
//                   itemCount: 5,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 20.0),
//                       // child: FirstTab(),
//                       child: StyleCard(
//                           rate: '🌟 4.5',
//                           title: 'Happy Bones',
//                           isOpen: 'OPEN',
//                           category: 'Italian',
//                           image: 'assets/images/Register.png',
//                           about: 'Lorem Ipsum is simply dummy text',
//                           size: MediaQuery.of(context).size.width * 0.91,
//                           onPress: () {
//                             Navigator.pushNamed(
//                                 context, '/DetailScreen');
//                           }),
//                     );
//                   }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
