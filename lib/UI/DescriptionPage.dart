import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lmra/Data/Auth.dart';
import 'package:lmra/Data/UserSingleton.dart';

import 'MangaPage.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  Future<QuerySnapshot> snap;

  Future<QuerySnapshot> getSnap() async {
    return Firestore.instance
        .collection('BNHA')
        .orderBy('number', descending: true)
        .getDocuments();
  }

  void initState() {
    updateUserDetails().then((value) => setState(() {}));
    snap = getSnap();
    super.initState();
  }

  Future updateUserDetails() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      UserSingleton().fireUser = user;
      Auth.setUserData(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: UserSingleton().fireUser == null
                  ? Text('name')
                  : Text(UserSingleton().fireUser.displayName),
              accountEmail: UserSingleton().fireUser == null
                  ? Text('email')
                  : Text(UserSingleton().fireUser.email),
              currentAccountPicture: GestureDetector(
                child: UserSingleton().fireUser == null
                    ? CircleAvatar(
                        backgroundColor: Colors.blue,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(UserSingleton().fireUser.photoUrl)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () => _showAbout(),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign out"),
              onTap: () {
                Auth.logoutUser().then((value) =>
                    Navigator.of(context).pushReplacementNamed('/SignInPage'));
              },
            ),
          ],
        ),
      ),
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
            ),
            FutureBuilder(
                future: snap,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Container(child: Center(child: Text('Hm')));
                    case ConnectionState.waiting:
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 215),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return ListView.builder(
                          padding: EdgeInsets.all(0),
                          primary: false,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                snapshot.data.documents[index].documentID,
                                style: TextStyle(fontSize: 18),
                              ),
                              onTap: () {
                                var docId =
                                    snapshot.data.documents[index].documentID;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MangaPage(doc: docId)));
                              },
                            );
                          });
                    default:
                      return Container(
                          child: Center(
                        child: Text(
                            'There seems to be an issue with the database. \nPlease try again later.'),
                      ));
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            snap = getSnap();
          });
        },
      ),
    );
  }

  void _showAbout() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("About The App"),
            content: RichText(
                text: TextSpan(
              text:
                  "This app has been made by Ansuman Acharya. If you have any reviews/feedback, drop me an email at ansuman91225@gmail.com",
              style: TextStyle(color: Colors.white),
            )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'))
            ],
          );
        });
  }
}
