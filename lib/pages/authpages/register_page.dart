import 'package:chtpro/components/auth/auth_service.dart';
import 'package:chtpro/components/auth/auth_service.dart';
import 'package:chtpro/components/util/my_buttton.dart';
import 'package:chtpro/components/util/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //signUP method
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("password do not match")));
      return;
    }
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
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
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor:
            Colors.blue.withOpacity(0.0), //You can make this transparent
        elevation: 0.0, //No shadow
      ),
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
                //passwordconfirm textfield
                MytextField(
                    controller: confirmPasswordController,
                    hintText: "pasword",
                    obscureText: true),
                const SizedBox(
                  height: 50,
                ),

                //login button
                MyButton(
                  onTap: signUp,
                  text: "create user",
                ),

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
