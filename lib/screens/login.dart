import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "UserName"),
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: "Password"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("LogIn"))
        ],
      ),
    );
  }
}
