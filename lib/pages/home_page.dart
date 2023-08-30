import 'package:chtpro/components/auth/auth_service.dart';
import 'package:chtpro/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //sign user out
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("homepage"),
          actions: [
            //signout button
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 160.0, top: 8.0),
          child: Column(
            children: <Widget>[
              if (currentUser?.email == 'nas@gmail.com')
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterPage()));
                  },
                  label: const Text('add member'),
                  icon: const Icon(Icons.add),
                ),
            ],
          ),
        )

            // body: SafeArea(
            //   child: Visibility(
            //     visible: isAdmin(),
            //     child: FloatingActionButton(
            //       onPressed: () {
            //         // Add member button logic here
            //       },
            //       child: const Icon(Icons.add),
            //     ),
            //   ),
            // ),
            ));
  }

  // isAdmin() {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   if (currentUser?.email == 'email_of_user_you_want_to_display') {

  //   }
  // }
}
