import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_attack/controllers/authController.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Username'),
                controller: usernameController,
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: emailController,
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                controller: passwordController,
              ),
              RaisedButton(
                child: Text('Sing Up'),
                onPressed: () {
                  controller.createUser(usernameController.text,
                      emailController.text, passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
