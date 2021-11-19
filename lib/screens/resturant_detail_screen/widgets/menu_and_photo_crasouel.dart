import 'package:flutter/material.dart';

class MenuAndPhototsCrasouel extends StatelessWidget {
  const MenuAndPhototsCrasouel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 5.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/chinese.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          );
        },
      ),
    );
  }
}
