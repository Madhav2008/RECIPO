import 'package:Foodybite/auth/auth_services.dart';
import 'package:Foodybite/screens/forget_password_screen/forget_password_screen.dart';
import 'package:Foodybite/screens/login_screen/login_screen.dart';
import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
import 'package:Foodybite/screens/register_screen/register_screen.dart';
import 'package:Foodybite/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipo',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/loginScreen': (context) => LoginScreen(),
          '/navigationScreen': (context) => Navigation(),
          '/forgetScreen': (context) => ForgetScreen(),
          '/registerScreen': (context) => RegisterScreen(),
        },
      )
    );
  }
}