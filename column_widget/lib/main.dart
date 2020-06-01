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
          title: Text('Containters & Padding'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Hi There'),
            RaisedButton(
              child: Text('Button'),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.green,
              child: Text('I am in a Contianer'),
            )
          ],

        )
    );
  }
}
