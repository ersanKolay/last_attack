import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_attack/controllers/authController.dart';
import 'package:last_attack/screens/home.dart';
import 'package:last_attack/screens/login.dart';

class Root extends StatelessWidget {
  const Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => (Get.find<AuthController>().user != null) ? Home() : Login());
  }
}
