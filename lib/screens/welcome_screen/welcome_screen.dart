import 'package:Foodybite/widgets/circle_next_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key, t}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _visible = true;
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage('assets/images/Welcome.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 370,
            left: 130,
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 3),
              child: Text(
                'Maaga',
                style: TextStyle(
                  fontSize: 55.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 460,
            left: 190,
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 3),
              child: CircleNextButton(
                onPress: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}