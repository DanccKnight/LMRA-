import 'package:flutter/material.dart';

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
                child: img,
              ),
            ),
          ),
        ]));
  }
}
