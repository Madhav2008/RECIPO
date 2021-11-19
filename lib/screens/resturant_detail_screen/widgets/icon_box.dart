import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    Key key,
    this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(55.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    onPressed: null),
              ),
              SizedBox(width: 15.0),
              Text(
                '$phoneNumber',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.map_rounded,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    onPressed: null),
              ),
              SizedBox(width: 15.0),
              Text(
                'Direction',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
