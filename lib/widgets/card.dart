import 'package:Foodybite/widgets/small_tag.dart';
import 'package:Foodybite/widgets/small_text_box.dart';
import 'package:flutter/material.dart';

class StyleCard extends StatelessWidget {
  const StyleCard({
    Key? key,
    required this.image,
    required this.title,
    required this.isOpen,
    required this.rate,
    required this.category,
    required this.about,
    required this.onPress,
    required this.size,
  }) : super(key: key);
  final String image, title, isOpen, rate, category, about;
  final double size;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
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
        onTap: onPress(),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 170,
              child: Container(
                width: size,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                    left: 10,
                    right: 10,
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
                            color: Colors.pink[200]!,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '$about',
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
                color: Colors.greenAccent[700]!,
              ),
            ),
            Positioned(
                top: 3,
                right: 28,
                child: IconButton(
                  icon: Icon(Icons.favorite_outline_sharp),
                  color: Colors.redAccent,
                  iconSize: 30,
                  onPressed: () {},
                )
            ),
            Positioned(
              top: 17,
              right: 0,
              child: SmallTextBox(
                title: '$rate',
                color: Colors.white,
                color2: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}