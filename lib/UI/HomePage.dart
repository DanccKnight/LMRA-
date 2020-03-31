import 'package:flutter/material.dart';
import 'package:lmra/Data/UserSingleton.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Welcome, ${UserSingleton().user.name}"),
            RaisedButton(
                child: Text("View chapters"),
                onPressed: () =>
                    Navigator.of(context).pushNamed('/DisplayChaptersPage')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/DescriptionPage')),
    );
  }
}
