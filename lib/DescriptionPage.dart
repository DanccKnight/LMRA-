import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  Image img;

  void initState() {
    super.initState();
    img = Image.asset("Assets/Images/bnha.jpg");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(img.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
          Container(
            child: img,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
            ),
          )
        ],
      ),
    ));
  }
}
