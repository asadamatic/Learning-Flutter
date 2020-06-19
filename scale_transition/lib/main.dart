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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  AnimationController animationPosition;
  AnimationController animationController;
  Animation<double> animation;
  Animation<Offset> animationOffset;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animationPosition = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 1.0,
      end: 4.0
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));
    animationOffset = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(5.0, 5.0)
    ).animate(animationPosition);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SlideTransition(
          position: animationOffset,
          child: RotationTransition(
            turns: animation,
            child: ScaleTransition(
              scale: animation,
              child: FlutterLogo(),
            ),
          ),
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: (){
              animationController.forward();
            },
          ),
          FloatingActionButton(
            child: Icon(
              Icons.remove,
            ),
            onPressed: (){
              animationController.reverse();
            },
          ),
          FloatingActionButton(
            child: Icon(
              Icons.move_to_inbox,
            ),
            onPressed: (){
              animationPosition.repeat(reverse: true);
            },
          ),
        ],
      ),
    );
  }
}
