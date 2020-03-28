import 'package:flutter/material.dart';
import 'package:lmra/DescriptionPage.dart';
import 'package:lmra/Utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMRA',
      home: MyHomePage(
        title: "LMRA",
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/DescriptionPage': (BuildContext context) => new DescriptionPage(),
        '/DisplayChaptersPage': (BuildContext context) =>
            new DisplayChaptersPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState(){
    super.initState();
    _messaging.getToken().then((value) => print("token -> $value"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("View chapters"),
            onPressed: () =>
                Navigator.of(context).pushNamed('/DisplayChaptersPage')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/DescriptionPage')),
    );
  }
}
