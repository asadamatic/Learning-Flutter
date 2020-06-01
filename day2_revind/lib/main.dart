import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Day 2 Revind'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Builder(
                builder: (context) =>
              GestureDetector(
                child: Icon(
                  Icons.search,
                ),
                onTap: () {
                  final snackBar = SnackBar( content: Text('Search for destinations...'),);
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Builder(
                  builder: (context) =>
                GestureDetector(
                child: Icon(
                  Icons.more_vert,
                ),
                onTap: () {
                  final snackBar = SnackBar( content: Text('More options not available...'),);
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              )
              ),
            )
          ],
        ),
        body: Builder(
          builder: (context) =>
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                child: Image.asset('Assets/image.jpg')
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  child: FlatButton.icon(
                    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Yay! A SnackBar!'),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      },
                      icon: Icon( Icons.person),
                      label: Text(
                        'Visit',
                        style: TextStyle(
                        fontSize: 18,
                      ),),
                      color: Colors.blue,
                      textColor: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                child: Text(
                    'Mountains',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'IndieFlower',
                      fontWeight: FontWeight.bold,
                    ),
                )
                )
              ],
            )
          ],
        ),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Asad Hameed'),
              accountEmail: Text('asadamatic@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                ),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'B',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'C',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.inbox,
              ),
              title: Text('All Inboxes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
              ),
              title: Text('Primary'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.drafts
              ),
              title: Text('Drafts'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
        
    );
  }
}
