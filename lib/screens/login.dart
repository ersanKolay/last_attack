import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_attack/controllers/authController.dart';
import 'package:last_attack/screens/signup.dart';

class Login extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text('Stored Count: ' +
                      Get.find<AuthController>().user.toString());
                }),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  controller: emailController,
                ),
                SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  controller: passwordController,
                  obscureText: true,
                ),
                RaisedButton(
                  child: Text('Log In'),
                  onPressed: () {
                    controller.login(
                        emailController.text, passwordController.text);
                  },
                ),
                RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    Get.to(SignUp());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
