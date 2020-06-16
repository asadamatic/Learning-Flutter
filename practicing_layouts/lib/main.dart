import 'package:flutter/material.dart';
import 'package:practicinglayouts/ColumnLayout.dart';
import 'package:practicinglayouts/ListViewlayout.dart';
import 'package:practicinglayouts/RowLayout.dart';

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
      routes: {
        '/': (context) => ListViewlayout(),
      },
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

  List<int> integers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(

          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: integers.map((integer) => Container(
                  child: Text('$integer'),
                  width: 100.0,
                )).toList(),
              ),
            ),
            Column(
              children: integers.map((integer) => Container(
                child: Text('$integer'),
                height: 100.0,
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
}
