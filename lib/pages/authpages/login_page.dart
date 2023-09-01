import 'package:chtpro/components/auth/auth_service.dart';
import 'package:chtpro/components/util/my_buttton.dart';
import 'package:chtpro/components/util/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //sign in user
  void signIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                //logo
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.message,
                  size: 70,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 50,
                ),
                //welcome back mesage
                const Text(
                  "wellcome back ",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),

                //email textfiled
                MytextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),
                const SizedBox(
                  height: 50,
                ),

                //password textfield
                MytextField(
                    controller: passwordController,
                    hintText: "pasword",
                    obscureText: true),
                const SizedBox(
                  height: 50,
                ),

                //login button
                MyButton(onTap: signIn, text: "sign In"),

                const SizedBox(
                  height: 50,
                ),

                //register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
