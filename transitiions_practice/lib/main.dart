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
      home: MyHomePage(title: 'Transition Practice'),
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
  int _counter = 0;
  double rotationTargetYellow = 1.6;
  double rotationTargetBlue = 0.0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 0.0,
            end: rotationTargetBlue,
          ),
          duration: Duration(seconds: 1),
          builder: (BuildContext context, double rotation, Widget child){

            return Transform(
              transform: Matrix4.rotationY(rotation * .5),
              origin: Offset(0.0, 0.0),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                  leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                    ),
                    onPressed: () {
                      setState(() {
                        rotationTargetYellow = rotationTargetYellow == 1.6 ? 0.0 : 1.6;
                        rotationTargetBlue = rotationTargetBlue == 0.0 ? 1.6 : 0.0;
                      });
                    },
                  ),
                ),
                body: Center(
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ), // This trailing comma makes auto-formatting nicer for build methods.
              ),
            );
          },
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 1.6,
            end: rotationTargetYellow,
          ),
          duration: Duration(seconds: 1),
          builder: (BuildContext context, double rotation, Widget child){

            return Transform(
              transform: Matrix4.rotationY(rotation),
              child: Container(
                color: Colors.yellow,
              ),
            );
          },
        )

      ],
    );
  }
}
