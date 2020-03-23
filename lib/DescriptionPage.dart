import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
          ),
          elevation: 5,
          expandedHeight: 200,
          backgroundColor: Colors.blueAccent,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('My Hero Academia'),
          ),
        ),
        
      ],
    ));
  }
}
