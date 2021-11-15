import 'package:Foodybite/auth/auth_services.dart';
import 'package:Foodybite/screens/forget_password_screen/forget_password_screen.dart';
import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
import 'package:Foodybite/screens/register_screen/register_screen.dart';
import 'package:Foodybite/widgets/big_blue_button.dart';
import 'package:Foodybite/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _visible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _visible = true;
      });
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
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
                SizedBox(height: 70),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: TextSimpleButton(
                    title: 'Forget password?',
                    colors: Colors.white,
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetScreen()));
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .6,
                  child: BigBlueButton(
                    title: 'Login',
                    onPress: () async {
                      authService.signInWithEmailAndPassword(emailController.text,passwordController.text).then((auth)
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()));
                      }).catchError((error){
                        showDialog(context: context,
                            builder: (con) {
                              return AlertDialog(title: Text("Error"),content: Text(error.toString()),);
                            } );
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create new account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextSimpleButton(
                      title: 'Register',
                      colors: Colors.blue,
                      onPress: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
