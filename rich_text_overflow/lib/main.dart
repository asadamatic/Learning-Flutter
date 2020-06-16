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
      home: MyHomePage(title: 'Rich Text Overflow'),
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

  String text = 'My name is asad and I am leaning flutter and Flutter is awesome.My name is asad and I am leaning flutter and Flutter is awesome.';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.business,
                      size: 45.0,
                      color: Colors.greenAccent,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Asad', style: TextStyle(fontSize: 20.0,color: Colors.black, fontWeight: FontWeight.bold),),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '$text',
                                      style: TextStyle(
                                          color: Colors.black)),
                                ]
                              ),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
