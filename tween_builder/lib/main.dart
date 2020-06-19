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

  double targetvalue = 24.0;
  double animatedSize = 24.0;
  double elevationTarget = 25.0;
  double transformTarget = 50.0;
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: elevationTarget),
              duration: Duration(milliseconds: 1),
              builder: (BuildContext context, double elevation, Widget child){

                return Card(
                  elevation: elevation,
                  child: FlatButton(
                    child: Text('Elevate'),
                    onPressed: (){
                      setState(() {
                        elevationTarget = elevationTarget == 25.0? 0.0 : 25.0;
                        transformTarget = transformTarget == 50.0 ? 0.0 : 50.0;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Center(
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: transformTarget),
                  duration: Duration(seconds: 3),
                  builder: (BuildContext context, double transform, Widget child){

                    return Transform.translate(
                        offset: Offset(0.0, transform),
                        child: Container(
                          color: Colors.red,
                          height: 100.0,
                          width: 100.0,
                        ),
                    );
                  },
                )
          ),
          Center(
            child: Slider(
              value: sliderValue,
              min: 0.0,
              max: 50.0,
              onChanged: (value){

                setState(() {
                  sliderValue = value;
                  transformTarget = value;
                });
              },
            ),
          )
        ],
      ),
      );

  }
}
