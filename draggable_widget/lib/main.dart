import 'dart:ui';

import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          children: <Widget>[
            Draggable(
              child: Container(
                color: Colors.green,
                child: Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
              feedback: Container(
                color: Colors.red,
                child: Text(
                'You have pushed the button this many times:',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
            ),
              ),
            ),
            Draggable(
              child: Card(
                child: IconButton(
                  icon: Icon(
                    Icons.directions_bike,
                    size: 24.0,
                  ),
                ),
              ),
              feedback: Card(
                child: IconButton(
                  icon: Icon(
                    Icons.directions_bike,
                    size: 48.0,
                  ),
                ),
              ),
              childWhenDragging: Card(
                elevation: 10.0,
                color: Colors.redAccent,
                child: Container(
                  height: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
