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
        body: Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 250),
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Images/bnha.jpg'),
                  fit: BoxFit.cover)),
          child: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26,
              ),
              onTap: () => Navigator.of(context).pop()),
        ),
      ],
    ));
  }
}
