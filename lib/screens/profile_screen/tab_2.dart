import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                SizedBox(width:5),
                Text(
                    "Liked Post Will Be Displayed Here.", style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width:5),
                Icon(Icons.favorite),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.construction),
                SizedBox(width:5),
                Text(
                    "Feature Under Development.", style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width:5),
                Icon(Icons.construction),
              ],
            ),
          ),
        ],
      ),
    );
    // return GridView.builder(
    //     itemCount: 7,
    //     gridDelegate:
    //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.all(4.0),
    //         child: Container(
    //           child: Expanded(
    //             child: Hero(
    //               child: Container(
    //                 child: ClipRRect(
    //                   child: Image.asset(
    //                     "assets/images/Login.png",
    //                     fit: BoxFit.cover,
    //                   ),
    //                   borderRadius:
    //                   BorderRadius.circular(20),
    //                 ),
    //
    //               ),
    //               tag: "assets/images/Login.png",
    //             ),
    //           ),
    //         ),
    //       );
    //     });
  }
}