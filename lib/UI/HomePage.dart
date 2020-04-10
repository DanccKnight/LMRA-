import 'package:flutter/material.dart';
import 'package:lmra/Data/UserSingleton.dart';
import 'package:lmra/Data/Auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                Auth.logoutUser().then((value) =>
                    Navigator.of(context).pushReplacementNamed('/SignInPage'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/DescriptionPage')),
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
