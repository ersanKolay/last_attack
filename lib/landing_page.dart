import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_attack/sign_in_page.dart';
import 'home_page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  _checkUser() {
    _user = FirebaseAuth.instance.currentUser;
  }

  _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  void initState() {
    _checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn: (user) {
          _updateUser(user);
        },
      );
    } else {
      return HomePage(user: _user);
    }
  }
}
