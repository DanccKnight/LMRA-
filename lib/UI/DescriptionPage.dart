import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  Image img;
  Future<QuerySnapshot> snap;

  void initState() {
    super.initState();
    img = Image.asset("Assets/Images/bnha.jpg");
    snap = getSnap();
  }

  Future<QuerySnapshot> getSnap() async {
    return Firestore.instance.collection('BNHA').getDocuments();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(img.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 220),
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
          FutureBuilder(
              future: snap,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  default:
                    return ListView.builder(
                      primary: false,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title:
                                Text(snapshot.data.documents[index].documentID),
                          );
                        });
                    break;
                }
              })
        ],
      ),
    ));
  }
}
