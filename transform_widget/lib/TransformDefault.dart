import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransFormDefault extends StatefulWidget{


  @override
  State createState() {
    return TransFormDefaultState();
  }
}

class TransFormDefaultState extends State<TransFormDefault>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Transform(
              transform: Matrix4.skewX(0.5),
              child: Container(
                color: Colors.red,
                height: 200.0,
                width: 200.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform(
              transform: Matrix4.skewX(-.5),
              child: Container(
                color: Colors.green,
                height: 200.0,
                width: 200.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform(
              transform: Matrix4.skewX(.5)..rotateX(10.0)..rotateZ(1.0)..rotateY(10.0),
              child: Container(
                color: Colors.amber,
                height: 200.0,
                width: 200.0,
              ),
            ),
          )
        ],
      ),

    );
  }
}