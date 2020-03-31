import 'package:flutter/material.dart';
import 'package:lmra/UI/DescriptionPage.dart';
import 'package:lmra/Utils.dart';
import 'package:lmra/UI/HomePage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lmra/UI/SignIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMRA',
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/SignInPage': (BuildContext context) => SignInPage(),
        '/HomePage': (BuildContext context) => MyHomePage(title: 'LMRA'),
        '/DescriptionPage': (BuildContext context) => DescriptionPage(),
        '/DisplayChaptersPage': (BuildContext context) => DisplayChaptersPage()
      },
    );
  }
}

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

        final snackbar = SnackBar(
          content: Text(message['notification']['title']),
          action: SnackBarAction(label: 'Go', onPressed: () => null),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
