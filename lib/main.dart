import 'package:flutter/material.dart';
import 'package:lmra/DescriptionPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMRA',
      home: MyHomePage(title: "LMRA",),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/DescriptionPage': (BuildContext context) => new DescriptionPage()
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/DescriptionPage')),
    );
  }
}
