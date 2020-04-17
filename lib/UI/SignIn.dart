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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: FlutterLogo(size: 150),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(60.0, 100.0, 60.0, 0.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blue,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () async {
                        await Auth.signInWithGoogle().then((value) {
                          Navigator.of(context)
                              .pushReplacementNamed('/HomePage');
                        });
                      },
                      child: Text("Login with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle().copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ]),
      ),
    );
  }
}
