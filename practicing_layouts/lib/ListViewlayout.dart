import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewlayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

        ),
        body: ListView(

          children: <Widget>[
            Row(
              children: <Widget>[
               Expanded(
                 child: FlatButton(
                   child: Text('Hi'),
                   color: Colors.green,
                   onPressed: () {
                     
                   },
                 ),
               )
              ],
            )
          ],
        )
    );
  }
}