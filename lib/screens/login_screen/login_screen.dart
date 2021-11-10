// import 'package:Foodybite/auth/auth_services.dart';
// import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
// import 'package:Foodybite/widgets/big_blue_button.dart';
// import 'package:Foodybite/widgets/text_button.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _visible = false;
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       setState(() {
//         _visible = true;
//       });
//     });
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       // resizeToAvoidBottomPadding: false,
//       body: AnimatedOpacity(
//         opacity: _visible ? 1.0 : 0.0,
//         duration: Duration(seconds: 3),
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/Login.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.black54,
//             ),
//             child: SingleChildScrollView(
//               reverse: true,
//               child: Column(
//                 children: [
//                   SizedBox(height: 100),
//                   Text(
//                     'Maaga',
//                     style: TextStyle(
//                       fontSize: 55.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 100),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       controller: emailController,
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Colors.transparent, width: 0.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.transparent, width: 0.0),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.mail,
//                           color: Colors.white,
//                         ),
//                         hintText: 'Email',
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                         ),
//                         fillColor: Colors.white,
//                         focusColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       obscureText: true,
//                       controller: passwordController,
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Colors.transparent, width: 0.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.transparent, width: 0.0),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.lock,
//                           color: Colors.white,
//                         ),
//                         hintText: 'Password',
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                         ),
//                         fillColor: Colors.white,
//                         focusColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 180),
//                     child: TextSimpleButton(
//                       title: 'Forget password?',
//                       colors: Colors.white,
//                       onPress: () {
//                         Navigator.pushNamed(context, '/forgetScreen');
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: BigBlueButton(
//                       title: 'Login',
//                       onPress: ()async{
//                         authService.signInWithEmailAndPassword(emailController.text,passwordController.text);
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()));
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         bottom: MediaQuery.of(context).viewInsets.bottom),
//                     child: TextSimpleButton(
//                       title: 'Create New Account',
//                       colors: Colors.white,
//                       onPress: () {
//                         Navigator.pushNamed(context, '/registerScreen');
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

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
                Text(
                  'Maaga',
                  style: TextStyle(
                    fontSize: 55.0,
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgetScreen()));
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
                      authService.signInWithEmailAndPassword(emailController.text,passwordController.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()));
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
