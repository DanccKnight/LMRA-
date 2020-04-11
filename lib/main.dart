import 'package:flutter/material.dart';
import 'package:lmra/UI/DescriptionPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lmra/UI/SignIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMRA',
      theme: ThemeData.dark(),
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/SignInPage': (BuildContext context) => SignInPage(),
        '/DescriptionPage': (BuildContext context) => DescriptionPage(),
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
      //Called when app is in foreground and we get a notification
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final snackbar = SnackBar(
          content: Text(message['notification']['title']),
          action: SnackBarAction(label: 'Go', onPressed: () => Navigator.of(context).pushNamed('/DescriptionPage')),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      //Called when app is in the background
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DescriptionPage()));
      },
      //Called when app is terminated and we get a notiification
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DescriptionPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
