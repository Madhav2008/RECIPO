import 'package:Foodybite/widgets/big_blue_button.dart';
import 'package:Foodybite/widgets/text_button.dart';
import 'package:Foodybite/widgets/textinput_opacity.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Register.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23.0, left: 15.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 35.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 85.0,
                      ),
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.white12,
                      child: Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 110,
                      child: CircleIconButton(
                        icon: Icon(
                          Icons.arrow_upward_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 110),
                TextInputOpacity(
                  icon: Icon(
                    Icons.supervised_user_circle_outlined,
                    color: Colors.white,
                  ),
                  title: 'Name',
                ),
                SizedBox(height: 20),
                TextInputOpacity(
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  title: 'Email',
                ),
                SizedBox(height: 20),
                TextInputOpacity(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: 'Password',
                ),
                SizedBox(height: 20),
                TextInputOpacity(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: 'Confirm Password',
                ),
                SizedBox(height: 55),
                BigBlueButton(title: 'Register'),
                SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    TextSimpleButton(
                      title: 'Login',
                      colors: Colors.blue,
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key key,
    this.icon,
    this.onPress,
  }) : super(key: key);
  final Icon icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: IconButton(
        icon: icon,
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}
