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
      home: MyHomePage(title: 'Animation builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _counter = 0;
  AnimationController animationController;
  Animation<double> animation;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    animation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(animationController);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          AnimatedBuilder(
            animation: animationController,
            child: Align(
              child: Container(
               color: Colors.blueAccent,
                height: 50.0,
                width: 80.0,
              ),
            ),
            builder: (BuildContext context, Widget child){

              return Transform.rotate(
                  angle: animationController.value * 2.0,
                  child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController,
            child: Align(
              child: Container(
                height: 60.0,
                width: 40.0,
                color: Colors.redAccent,
              ),
            ),
            builder: (BuildContext context, Widget child){

              return Transform.translate(
                offset: Offset(0.0, animationController.value * 100.0),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child){

              return RotationTransition(
                turns: animation,
                child: Align(
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amberAccent,
                      gradient: LinearGradient(
                        colors: [Colors.amberAccent, Colors.greenAccent]
                      )
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
