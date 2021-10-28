import 'package:Foodybite/auth/auth_services.dart';
import 'package:Foodybite/screens/detail_screen/detail_screen.dart';
import 'package:Foodybite/screens/forget_password_screen/forget_password_screen.dart';
import 'package:Foodybite/screens/login_screen/login_screen.dart';
import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
import 'package:Foodybite/screens/register_screen/register_screen.dart';
import 'package:Foodybite/screens/search_screen/search_screen.dart';
import 'package:Foodybite/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     Provider<AuthService>(
    //       create: (_) => AuthService(),
    //     )
    //   ],
       MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(brightness: Brightness.dark),
        title: 'Maaga',
        initialRoute: '/',
        routes: {
          '/': (context) => BottomNavigation(),
          '/second': (context) => LoginScreen(),
          '/navigationScreen': (context) => BottomNavigation(),
          '/searchScreen': (context) => SearchScreen(),
          '/DetailScreen': (context) => DetailScreen("assets/images/Register.png"),
          '/forgetScreen': (context) => ForgetScreen(),
          '/registerScreen': (context) => RegisterScreen(),
        },
      );
    // );
  }
}