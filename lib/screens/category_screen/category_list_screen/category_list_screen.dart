// import 'package:flutter/material.dart';
//
// class CategoryList extends StatelessWidget {
//   const CategoryList({
//     Key? key,
//     required this.title,
//     required this.image,
//     required this.onPress,
//   }) : super(key: key);
//   final String title, image;
//   final Function onPress;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onPress();
//       },
//       child: Container(
//         padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 16.0),
//         child: Material(
//           elevation: 5.0,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//           child: Stack(
//             children: <Widget>[
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(5.0),
//                   child: Image.asset(image)),
//
//               Positioned(
//                 bottom: 20.0,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                   color: Colors.black.withOpacity(0.7),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(title,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold
//                           )
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required this.title,
    required this.image,
    required this.onPress,
  }) : super(key: key);
  final String title, image;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 16.0),
        child: Material(
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(image)
              ),

              Positioned(
                bottom: 20.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
