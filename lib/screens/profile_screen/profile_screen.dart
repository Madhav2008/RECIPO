// import 'package:Foodybite/screens/profile_screen/tab_1.dart';
// import 'package:Foodybite/screens/profile_screen/tab_2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gradient_text/gradient_text.dart';
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: GradientText(
//             'Profile',
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(255, 138, 110, 1),
//                 Color.fromRGBO(255, 63, 111, 1),
//               ],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//         ),
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Container(
//               height: 120,
//               width: 120,
//               child: Image.asset("assets/try.png", fit: BoxFit.cover),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.grey[200],
//               ),
//             ),
//
//             // username
//             Padding(
//               padding: const EdgeInsets.only(bottom:20),
//               child: Text(
//                 '@aroramadhav65',
//                 style: TextStyle(color: Colors.blue, fontSize: 20),
//               ),
//             ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.centerRight,
//                     child: Column(
//                       children: [
//                         Text(
//                           '37',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           'Following',
//                           style: TextStyle(color: Colors.blue, fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: Column(
//                       children: [
//                         Text(
//                           '8',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           'Followers',
//                           style: TextStyle(color: Colors.blue, fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       children: [
//                         Text(
//                           '56',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           '  Likes  ',
//                           style: TextStyle(color: Colors.blue, fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 15),
//
//             // buttons -> edit profile, insta links, bookmark
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//                   child: Text('Edit profile',
//                       style: TextStyle(color: Colors.black, fontSize: 20)
//                   ),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(5)
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(15),
//                   child: Icon(
//                     Icons.bookmark_border,
//                     color: Colors.grey[800],
//                   ),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(5)),
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//             Text(
//               '🖋 Your Bio 🖋',
//               style: TextStyle(color: Colors.black),
//             ),
//
//             // default tab controller
//
//             TabBar(
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.grid_3x3, color: Colors.black),
//                 ),
//                 Tab(
//                   icon: Icon(Icons.favorite, color: Colors.black),
//                 ),
//               ],
//             ),
//
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   FirstTab(),
//                   SecondTab(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:Foodybite/auth/auth_services.dart';
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
              onPressed: ()async {
                authService.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              // icon: Icon(Icons.power_settings_new_rounded), color: Colors.white,)
              icon: Icon(Icons.logout_sharp), color: Colors.white,)
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
            Container(
                color: Color.fromRGBO(226, 55, 68, 0.20),
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child:Column(
                    children:[
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                      ),

                      // username
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '@aroramadhav65',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),

                      // number of following, followers, likes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Column(
                                children: [
                                  Text(
                                    '37',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    '8',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Text(
                                    '56',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '  Likes  ',
                                    style: TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      // buttons -> edit profile, insta links, bookmark
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                            child: Text('Edit profile',
                                style: TextStyle(color: Colors.black, fontSize: 20)
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Icon(
                              Icons.bookmark_border,
                              color: Colors.grey[800],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 48),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            '🖋 Your Bio 🖋',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.circular(5)),
                      ),

                    ]
                )
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
                )
            )
          ],
        ),
      ),
    );
  }
}