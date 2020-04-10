import 'package:flutter/material.dart';
import 'package:lmra/Data/Auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Sign in with Google'),
            onPressed: () async => Auth.signInWithGoogle()
                .then((value) => Navigator.of(context).pushReplacementNamed('/MangaPage'))),
      ),
    );
  }
}
