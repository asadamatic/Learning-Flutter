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
      home: MyHomePage(title: 'Future Builder'),
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

  Future<String> _futureFunction = Future.delayed(Duration(seconds: 3), () => 'Data Received').catchError(() => 'Data Not Received');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: FutureBuilder<String>(
          future: _futureFunction,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
            Text textWidget;
            if (snapshot.hasData){
              textWidget = Text(snapshot.data);
            }else if (snapshot.hasError){
              textWidget = Text(snapshot.error);
            }else{
              textWidget = Text('Waiting for data...');
            }

            return Center(
                child: textWidget,
            );
          }
      )
      ),

    );
  }
}
