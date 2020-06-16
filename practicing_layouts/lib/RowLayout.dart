import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

        ),
        body: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      width: 200.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}