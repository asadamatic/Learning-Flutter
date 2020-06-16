import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 200.0,
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}