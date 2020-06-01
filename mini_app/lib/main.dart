import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: NinjaCard(),
  ));
}

class NinjaCard extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child:
                CircleAvatar(
                  backgroundImage: AssetImage('Assets/asad.jpg'),
                  radius: 40.0,
                )
            ),
            SizedBox(height: 20.0,),
            Text('Name', style: TextStyle(fontSize: 15, color: Colors.grey, letterSpacing: 1),),
            SizedBox(height: 10.0,),
            Text('Asad Hameed', style: TextStyle(fontSize: 22, color: Colors.amberAccent, letterSpacing: 1.2, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            Text('Ninja Level', style: TextStyle(fontSize: 15, color: Colors.grey, letterSpacing: 1),),
            SizedBox(height: 10.0,),
            Text('10', style: TextStyle(fontSize: 22, color: Colors.amberAccent, letterSpacing: 1.2, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.mail, color: Colors.white70,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('asadamatic@gmail.com', style: TextStyle(fontSize: 16, color: Colors.white70, letterSpacing: 1.2),),
                )
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Asad Hameed', style: TextStyle(fontSize: 20, color: Colors.amberAccent, letterSpacing: 1.2, fontWeight: FontWeight.bold),),
              accountEmail: Text('asadamatic@gmail.com', style: TextStyle(fontSize: 16, color: Colors.white70, letterSpacing: 1.2),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('Assets/asad.jpg'),
                radius: 30.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[850]
              ),
            ),
            ListTile(
              leading: Icon(
              Icons.inbox
                ),
              title: Text('Inbox'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

