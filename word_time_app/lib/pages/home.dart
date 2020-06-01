import 'package:flutter/material.dart';

class Home extends StatefulWidget{


  @override
  State createState() {
    return _Home();
  }
}

class _Home extends State<Home>{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child:
      Column(
        children: <Widget>[
          FlatButton.icon(onPressed: () {
            Navigator.pushNamed(context, '/location');
          },
              icon: Icon(
                Icons.edit_location,
              ), label: Text('Edit Location'),
          ),
        ],
      ),
      ),
    );
  }


}