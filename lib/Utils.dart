import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayChaptersPage extends StatefulWidget {
  @override
  _DisplayChaptersPageState createState() => _DisplayChaptersPageState();
}

class _DisplayChaptersPageState extends State<DisplayChaptersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Chapters")),
        body: FutureBuilder(
            future: Firestore.instance
                .collection('My Hero Academia')
                .getDocuments(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              final int cardLength = snapshot.data.documents.length;
              return ListView.builder(
                itemCount: cardLength,
                itemBuilder: (BuildContext context, int index) {
                  final DocumentSnapshot _card = snapshot.data.documents[index];
                  return ListTile(
                    title: Text(snapshot.data.documents[index].documentID),
                  );
                },
              );
            }));
  }
}
