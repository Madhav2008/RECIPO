import 'package:Foodybite/widgets/big_blue_button.dart';
import 'package:Foodybite/widgets/textinput_opacity.dart';
import 'package:Foodybite/widgets/text_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _visible = true;
      });
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(seconds: 3),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Text(
                    'Maaga',
                    style: TextStyle(
                      fontSize: 55.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 200),
                  TextInputOpacity(
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    title: 'Email',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextInputOpacity(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    title: 'Password',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 220),
                    child: TextSimpleButton(
                      title: 'Forget password?',
                      colors: Colors.white,
                      onPress: () {
                        Navigator.pushNamed(context, '/forgetScreen');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BigBlueButton(
                    title: 'Login',
                    onPress: () {
                      Navigator.pushNamed(context, '/introScreen');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextSimpleButton(
                      title: 'Create New Account',
                      colors: Colors.white,
                      onPress: () {
                        Navigator.pushNamed(context, '/registerScreen');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
