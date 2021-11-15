// import 'package:flutter/material.dart';
// import 'package:gradient_text/gradient_text.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: GradientText(
//             "Maaga",
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(255, 138, 120, 1),
//                 Color.fromRGBO(255, 63, 111, 1),
//               ],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//             style: TextStyle(
//               fontSize: 35,
//               fontFamily: 'MuseoModerno',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           actions: [
//             GestureDetector(
//               onTap: () {
//                 showAboutDialog(
//                   context: context,
//                   applicationName: 'Maaga',
//                   applicationVersion: 'by Madhav Arora\n\nV1.0',
//                 );
//               },
//               child: Icon(
//                 Icons.info_outline,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         body: Column(
//
//         )
//     );
//   }
// }

import 'package:Foodybite/screens/home_screen/network_image.dart';
import 'package:Foodybite/screens/like_button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class HomeScreen extends StatelessWidget {
  static final String path = "lib/src/pages/travel/travel_home.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: GradientText(
            "Recipo",
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 138, 120, 1),
                Color.fromRGBO(255, 63, 111, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'MuseoModerno',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Maaga',
                  applicationVersion: 'by Madhav Arora\n\nV1.0',
                );
              },
              child: Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
            ),
          ],
        ),
      body: ListView(
        children: <Widget>[HomeScreenTop(), homeScreenBottom],
      ),
    );
  }
}

class HomeScreenTop extends StatefulWidget {
  @override
  _HomeScreenTopState createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<HomeScreenTop> {
  final TextStyle dropdownMenuLabel =
      TextStyle(color: Colors.white, fontSize: 16);
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  List<String> locations = ['1st', '2nd'];
  var selectedLocationIndex = 0;
  bool isfoodSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(226, 55, 68, 0.60),
                      Color.fromRGBO(226, 55, 68, 0.80),
                      Color.fromRGBO(226, 55, 68, 1.0),
                      Colors.redAccent,
                    ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      // Icon(
                      //   Icons.location_on,
                      //   color: Colors.white,
                      // ),
                      // SizedBox(
                      //   width: 16,
                      // ),
                      PopupMenuButton(
                        onSelected: (dynamic index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            // Text(
                            //   locations[selectedLocationIndex],
                            //   style: dropdownMenuLabel,
                            // ),
                            // Icon(
                            //   Icons.keyboard_arrow_down,
                            //   color: Colors.white,
                            // )
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          // PopupMenuItem(
                            // child: Text(
                            //   locations[0],
                            //   style: dropdownMenuItem,
                            // ),
                            // value: 0,
                          // ),
                          // PopupMenuItem(
                          //   child: Text(
                          //     locations[1],
                          //     style: dropdownMenuItem,
                          //   ),
                          //   value: 1,
                          // ),
                        ],
                      ),
                      Spacer(),
                      // Icon(
                      //   // Icons.settings,
                      //   // color: Colors.white,
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    width: 320,
                    child: Text(
                      "What Do You Want To Cook?",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: TextEditingController(text: 'Search Your Recipe'),
                      style: dropdownMenuItem,
                      decoration: InputDecoration(
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search, color: Colors.grey),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isfoodSelected = true;
                          });
                        },
                        child: ChoiceChip(
                            Icons.food_bank_sharp, "Sweetdish", isfoodSelected
                        )
                          ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isfoodSelected = false;
                          });
                        },
                        child: ChoiceChip(
                            Icons.food_bank_sharp, "Namkeen", !isfoodSelected
                        )
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isfoodSelected;

  ChoiceChip(this.icon, this.text, this.isfoodSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: widget.isfoodSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
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

final Widget homeScreenBottom = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("Top ",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          Spacer(),
          Builder(
              builder: (BuildContext context) => Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ))
        ],
      ),
    ),
    Container(
      height: 210,
      child: ListView(scrollDirection: Axis.horizontal, children: cityCards),
    )
  ],
);

List<CityCard> cityCards = [
  CityCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Recipe 1",
      "12 Feb",
      "10",
      "500",
      '440'
  ),
  CityCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Recipe 2",
      "12 Feb",
      "10",
      "500",
      '440'
  ),
  CityCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Recipe 3",
      "12 Feb",
      "10",
      "500",
      '440'
  ),
  CityCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Recipe 4",
      "12 Feb",
      "10",
      "500",
      '440'
  ),
  CityCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Recipe 5",
      "12 Feb",
      "10",
      "500",
      '440'
  ),
  CityCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Recipe 6",
      "12 Feb",
      "10",
      "500",
      '440'
  ),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: <Widget>[
            Container(
              width: 160,
              height: 210,
              child: PNetworkImage(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              width: 160,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12])),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              width: 145,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cityName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                      ),
                      Text(
                        monthYear,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      // decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     shape: BoxShape.rectangle,
                      //     borderRadius: BorderRadius.all(Radius.circular(10))),
                      // child: Text(
                      //   "$discount%",
                      //   style: TextStyle(color: Colors.black, fontSize: 14),
                      // )
                    // child: LikeButton()
                      child: IconButton(
                        icon: Icon(Icons.favorite_outline_sharp),
                        color: Colors.redAccent,
                        iconSize: 30,
                        onPressed: () {},
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
