import 'package:Foodybite/auth/auth_services.dart';
import 'package:Foodybite/auth/user_model.dart';
import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
import 'package:Foodybite/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_,AsyncSnapshot<User?>snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          final User?user=snapshot.data;
          return user == null ? WelcomeScreen() : Navigation();
        } else {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}
