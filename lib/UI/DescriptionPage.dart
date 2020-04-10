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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(UserSingleton().user.name),
                accountEmail: Text(UserSingleton().user.email),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        UserSingleton().user.profileImage == null
                            ? CircleAvatar()
                            : UserSingleton().user.profileImage),
                  ),
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
                  Auth.logoutUser().then((value) => Navigator.of(context)
                      .pushReplacementNamed('/SignInPage'));
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
                              title: Text(
                                  snapshot.data.documents[index].documentID),
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
              style: TextStyle(color: Colors.black),
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
