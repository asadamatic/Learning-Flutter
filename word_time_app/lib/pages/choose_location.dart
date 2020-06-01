import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget{

  @override
  State createState() {
    return _ChooseLocation();
  }
}

class _ChooseLocation extends State<ChooseLocation>{

  String text = 'Hi there!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[20],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(child: Column(
        children: <Widget>[
          Text(text),
          FlatButton(
            onPressed: () {
              setState(() {
                text = 'Hi Asad!';
              });
            },
            child: Text('Press me'),
          )
        ],
      )),
    );
  }
}