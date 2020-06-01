import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Drawer Navigation'),
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
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                      'B',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'C',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
              ),
            Divider(),
            Container(
                child: Text('Primary'),
              margin: EdgeInsets.only(left: 10.0),
            ),
            ListTile(
              leading: Icon(
                Icons.face,
              ),
              title: Text('Inbox'),
              trailing: Icon(
                Icons.inbox,
              ),
              onTap: () {},

            ),
            ListTile(
              leading: Icon(
                Icons.face,
              ),
             title: Text('Sent'),
              trailing: Icon(
                Icons.email,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text('Draft'),
              trailing: Icon(
                Icons.drafts,
              ),
              onTap: () {},
            ),
            Divider(),
            Container(
              child: Text('Secondary'),
              margin: EdgeInsets.only(left: 10.0),
            ),
            ListTile(
              leading: Icon(
                Icons.backup,
              ),
              title: Text('Backup'),
              trailing: Icon(
                Icons.face,
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    ),
  ));
}
