import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lmra/Data/Auth.dart';
import 'package:lmra/Data/UserSingleton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    updateUserDetails().then((value) => setState(() {}));
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
        appBar: AppBar(
          title: Text('LMRA'),
        ),
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
                  Auth.logoutUser().then((value) => Navigator.of(context)
                      .pushReplacementNamed('/SignInPage'));
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/DescriptionPage');
                },
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 180,
                        width: 130,
                        child: Image(
                            image: AssetImage('Assets/Images/mha1.jpg'),
                            fit: BoxFit.fill),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('Boku no Hero Academia',
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.w600)),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.5),
                                    child: Text('Action',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.5),
                                      child: Text(
                                        'Adventure',
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(padding: const EdgeInsets.only(bottom: 90)),
                            Padding(
                              padding: const EdgeInsets.only(top: 7,left: 0),
                              child: Text('Ongoing'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('/DescriptionPage');
                },
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 180,
                        width: 130,
                        child: Image(
                            image: AssetImage('Assets/Images/hh.jpg'),
                            fit: BoxFit.fill),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('Haikyuu!!',
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.w600)),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.5),
                                    child: Text('Sports',
                                        style: TextStyle(
                                            color:
                                            Colors.white.withOpacity(0.5))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.5),
                                      child: Text(
                                        'Comedy',
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(padding: const EdgeInsets.only(bottom: 90)),
                            Padding(
                              padding: const EdgeInsets.only(top: 7,left: 0),
                              child: Text('Ongoing'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

//185:130
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
