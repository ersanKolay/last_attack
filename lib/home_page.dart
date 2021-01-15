import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        actions: [FlatButton(child: Text(""),)],
      ),
      body: Center(
        child: Text("Hoşgeldiniz : " + user.uid),
      ),
    );
  }
}
