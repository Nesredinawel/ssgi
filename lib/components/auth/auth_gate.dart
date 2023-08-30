import 'package:chtpro/pages/home_page.dart';
import 'package:chtpro/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            //user logedin
            if (snapShot.hasData) {
              return const HomePage();
            }

            //user is not logged in
            else {
              return const LoginPage();
            }
          }),
    );
  }
}
