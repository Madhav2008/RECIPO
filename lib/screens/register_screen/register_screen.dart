import 'package:Foodybite/auth/auth_services.dart';
import 'package:Foodybite/screens/login_screen/button.dart';
import 'package:Foodybite/screens/login_screen/login_screen.dart';
import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
import 'package:Foodybite/widgets/text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    "https://github.com/Madhav2008/App-Assets/blob/main/RecipoLogo.png?raw=true",
                    width: 100,
                    height: 100
                ),
                Text(
                  'Recipo',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 0.0),
                      ),
                      prefixIcon: Icon(
                        Icons.supervised_user_circle_outlined,
                        color: Colors.white,
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 0.0),
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 0.0),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await authService.createUserWithEmailAndPassword(
                          emailController.text, passwordController.text).then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()));
                        Fluttertoast.showToast(
                            msg: "User Registered Successfully!!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM);
                      }).catchError((error){
                        showDialog(context: context,
                            builder: (con) {
                              return AlertDialog(title: Text("Error"),content: Text(error.toString()
                              ),);
                            } );
                      });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 50,
                  child: Buttons(
                    buttonText: 'Register',
                  ),
                ),
              ),
            ),
                SizedBox(
                  height: 30,
                ),
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
                    SizedBox(width: 5,),
                    TextSimpleButton(
                      title: 'Login',
                      colors: Colors.blue,
                      onPress: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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