import 'package:expliocitanimations/BoxAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      home: BoxAnimation(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _counter = 0;
  AnimationController animationControllerOne, animationControllerTwo, animationControllerThree, animationControllerFour;
  Animation<double> animationScaleOne, animationScaleTwo, animationScaleThree, animationScaleFour;
  AnimationController animationController;
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  void getAnimation() async{

    await Future.delayed(Duration(milliseconds: 300)).then((value) {
      animationControllerOne.repeat(reverse: true);

      Future.delayed(Duration(milliseconds: 600)).then((value) {
        animationControllerOne.stop();
      });
    });
    await Future.delayed(Duration(milliseconds: 300)).then((value) {
      animationControllerTwo.repeat(reverse: true);
      Future.delayed(Duration(milliseconds: 600)).then((value) {
        animationControllerTwo.stop();
      });
    });
    await Future.delayed(Duration(milliseconds: 300)).then((value) {
      animationControllerThree.repeat(reverse: true);
      Future.delayed(Duration(milliseconds: 600)).then((value) {
        animationControllerThree.stop();
      });
    });
    await Future.delayed(Duration(milliseconds: 300)).then((value) {
      animationControllerFour.repeat(reverse: true);
      Future.delayed(Duration(milliseconds: 600)).then((value) {
        animationControllerFour.stop();
      });
    });

    getAnimation();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse:  true);
    animationControllerOne = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    animationControllerTwo = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    animationControllerThree = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    animationControllerFour = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    getAnimation();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child){

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Transform.scale(
                      scale: animationControllerOne.value * 1.0,
                      child: Container(
                        color: Colors.red,
                        height: 30.0,
                        width: 15.0,
                      ),
                    ),
                    Transform.scale(
                      scale: animationControllerTwo.value * 1.0,
                      child: Container(
                        color: Colors.red,
                        height: 30.0,
                        width: 15.0,
                      ),
                    ),
                    Transform.scale(
                      scale: animationControllerThree.value * 1.0,
                      child: Container(
                        color: Colors.red,
                        height: 30.0,
                        width: 15.0,
                      ),
                    ),
                    Transform.scale(
                      scale: animationControllerFour.value * 1.0,
                      child: Container(
                        color: Colors.red,
                        height: 30.0,
                        width: 15.0,
                      ),
                    ),
                  ],
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
