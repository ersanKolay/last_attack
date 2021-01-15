import 'package:flutter/material.dart';
import 'package:last_attack/widgets/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  final Function(User) onSignIn;

  const SignInPage({Key key, this.onSignIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SocialButton(
              buttonColor: Colors.white,
              textColor: Colors.black87,
              buttonText: "Google ile oturum aç",
              buttonIcon: Image.asset("assets/images/google-logo.png"),
              onPressed: () {},
            ),
            SocialButton(
              buttonColor: Color(0xFF334D92),
              buttonText: "Facebook ile oturum aç",
              buttonIcon: Image.asset("assets/images/facebook-logo.png"),
              onPressed: () {},
            ),
            SocialButton(
              buttonText: "Email ve Şifre ile Giriş Yap",
              onPressed: () {},
              buttonIcon: Icon(
                Icons.email,
                size: 32,
                color: Colors.white,
              ),
            ),
            SocialButton(
              buttonText: "Misafir Giriş",
              onPressed: _misafirGiris,
              buttonColor: Colors.teal,
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  void _misafirGiris() async {
    UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();
    onSignIn(sonuc.user);
    print(sonuc.user.uid);
  }
}
