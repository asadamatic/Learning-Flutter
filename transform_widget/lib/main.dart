import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:transformwidget/TransformDefault.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TransFormDefault(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 360.0,
              origin: Offset(50.0, 50.0),
              child: Container(
                color: Colors.red,
                height: 100.0,
                width: 100.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.scale(
              scale: 2.0,
              origin: Offset(0.0, 0.0),
              child: Container(
                color: Colors.amber,
                height: 50.0,
                width: 50.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.scale(
              scale: 2.0,
              origin: Offset(50.0, 50.0),
              child: Container(
                color: Colors.green,
                height: 50.0,
                width: 50.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(-100.0 , -100.0),
              child: Container(
                color: Colors.green,
                height: 50.0,
                width: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
