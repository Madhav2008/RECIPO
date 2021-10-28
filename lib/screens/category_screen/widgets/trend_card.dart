import 'package:Foodybite/screens/category_screen/widgets/small_tag.dart';
import 'package:Foodybite/screens/category_screen/widgets/small_text_box.dart';
import 'package:flutter/material.dart';

class TrendCard extends StatelessWidget {
  const TrendCard({
    Key key,
    this.image,
    this.title,
    this.isOpen,
    this.rate,
    this.category,
    this.distance,
    this.address,
    this.onPress,
    this.size,
  }) : super(key: key);
  final String image, title, isOpen, rate, category, distance, address;
  final double size;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 6.0,
            spreadRadius: -3.0,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 165,
              child: Container(
                width: size,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '$title',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          SizedBox(width: 15.0),
                          SmallTag(
                            title: '$category',
                            color: Colors.pink[200],
                          ),
                          SizedBox(width: 10.0),
                          SmallTag(
                            title: '$distance',
                            color: Colors.purpleAccent,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '$address',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 20,
              child: SmallTextBox(
                color2: Colors.white,
                title: '$isOpen',
                color: Colors.greenAccent[700],
              ),
            ),
            Positioned(
              top: 15,
              right: 20,
              child: SmallTextBox(
                color2: Colors.white,
                title: '$rate',
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}