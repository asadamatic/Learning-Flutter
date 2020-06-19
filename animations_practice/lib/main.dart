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

  double height = 100, width = 100;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          height: height,
          width: width,
          duration: Duration(seconds: 1),
          curve: Curves.easeInExpo,
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: (){
              setState(() {
                height = 300.0;
                width = 300.0;
                color = Colors.blueAccent;
              });
            },
          ),
          FloatingActionButton(
            child: Icon(
              Icons.remove,
            ),
            onPressed: (){
              setState(() {
                height = 100.0;
                width = 100.0;
                color = Colors.greenAccent;
              });
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
