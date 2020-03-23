import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.of(context).pop(),
        ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0))),
        elevation: 5,
        expandedHeight: 200,
        backgroundColor: Colors.blue,
        pinned: true,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          /*centerTitle: true,
          title: Text(
            'Boku no Hero Academia',
          ),*/
          background: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
            child: Image.network(
                "https://images4.alphacoders.com/698/thumb-1920-698782.jpg"),
          ),
        ),
      ),
    ]));
  }
}
