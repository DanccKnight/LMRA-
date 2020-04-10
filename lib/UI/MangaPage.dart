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
    DocumentSnapshot document =
        await Firestore.instance.collection('BNHA').document(widget.doc).get();
    chapter = Chapter.fromJson(document.data);
    return document;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doc),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: doc,
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData)
                  return Container();
                return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: chapter.images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.network(
                          chapter.images[index].replaceAll(RegExp(r'\r'), ""),
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if(loadingProgress != null)
                              return Center(child: Padding(
                                padding: const EdgeInsets.only(top: 170,bottom: 190),
                                child: SizedBox(width:30, height: 30,child: CircularProgressIndicator()),
                              ));
                            else
                              return child;
                          },
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
