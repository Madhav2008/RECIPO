import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('assets/images/profile6.png'),
          ),
          SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Collin Fields'),
              Text('Lorem ipsum dolor sit amet consectetur'),
            ],
          ),
          SizedBox(
            width: 25.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(3.0),
            ),
            width: 50,
            height: 20,
            child: Center(
              child: Text(
                '🌟 4.5',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
