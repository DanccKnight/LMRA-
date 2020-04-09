import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'MangaPage.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  Image img;
  Future<QuerySnapshot> snap;

  Future<QuerySnapshot> getSnap() async {
    return Firestore.instance
        .collection('BNHA')
        .orderBy('number', descending: true)
        .getDocuments();
  }

  void initState() {
    super.initState();
    img = Image.asset("Assets/Images/bnha.jpg");
    snap = getSnap();
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
                if (!snapshot.hasData)
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 215),
                      child: CircularProgressIndicator(),
                    ),
                  );
                else
                  return ListView.builder(
                      primary: false,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title:
                              Text(snapshot.data.documents[index].documentID),
                          onTap: () {
                            var docId =
                                snapshot.data.documents[index].documentID;
                            //Navigator.of(context).pushNamed('/MangaPage');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MangaPage(doc: docId)));
                          },
                        );
                      });
              })
        ],
      ),
    ));
  }
}
