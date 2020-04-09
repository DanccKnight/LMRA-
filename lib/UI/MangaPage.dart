import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmra/Data/Chapter.dart';

class MangaPage extends StatefulWidget {
  var doc;

  MangaPage({Key key, this.doc}) : super(key: key);

  @override
  _MangaPageState createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  Future<DocumentSnapshot> doc;
  Chapter chapter;

  @override
  void initState() {
    super.initState();
    doc = getDoc();
  }

  Future<DocumentSnapshot> getDoc() async {
    DocumentSnapshot document = await Firestore.instance
        .collection('BNHA')
        .document('Boku no Hero Academia Chapter 265')
        .get();
    chapter = Chapter.fromJson(document.data);
    print(chapter.images);
    return document;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: doc,
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                    itemCount: chapter.images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.network(chapter.images[index]),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
