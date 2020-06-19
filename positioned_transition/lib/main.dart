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
  int _counter = 0, animatedCounter = 0;
  AnimationController animationController;
  Animation<RelativeRect> animation;
  AnimationController slideAnimationController;
  Animation<Offset> slideAnimation;
  Animation<double> scaleAnimation;
  AnimationController rotationTransitionController;
  Animation<double> rotationTransition;

  double scaleTarget = 1.0, translateTarget = 0.0;
  void _incrementCounter() {

    animationController.forward(from: 0.0);
    setState(() {
      animatedCounter++;
    });
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {

        _counter++;
        slideAnimationController.repeat(reverse: true);
        Future.delayed(Duration(milliseconds: 400)).then((value){
          slideAnimationController.stop();
          rotationTransitionController.forward(from: 0.0);
        });
      });
    });



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(290.0, 450.0, 30.0, 0.0),
      end: RelativeRect.fromLTRB(170.0, 300.0, 100.0, 180.0)
    ).animate(animationController);

    slideAnimationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.05, 0.0)
    ).animate(slideAnimationController);
    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(slideAnimationController);

    rotationTransitionController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );
    rotationTransition = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(rotationTransitionController);
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          color: Colors.yellow,
        ),
        TweenAnimationBuilder(
          tween: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(translateTarget, 0.0)
          ),
          duration: Duration(seconds: 1),
          builder: (BuildContext context, Offset offset, Widget child){

            return Transform.translate(
              offset: offset,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 1.0,
                  end: scaleTarget,
                ),
                duration: Duration(seconds: 1),
                builder: (BuildContext context, double scale, Widget child){

                  return Transform.scale(
                    scale: scale,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text(widget.title),
                        leading: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            setState(() {
                              scaleTarget =  scaleTarget == 1 ? .5 : 1;
                              translateTarget = translateTarget == 210.0 ? 0.0 : 210.0;
                            });
                          },
                        ),
                      ),
                      body: RotationTransition(
                        turns: rotationTransition,
                        child: Center(
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: ScaleTransition(
                                  scale: scaleAnimation,
                                  child: Text(
                                    'You have pushed the button this many times:',
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 300.0,
                                bottom: 180.0,
                                right: 100.0,
                                left: 170.0,
                                child: SlideTransition(
                                  position: slideAnimation,
                                  child: Text(
                                    '$_counter',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ),
                              PositionedTransition(
                                rect: animation,
                                child: SlideTransition(
                                  position: slideAnimation,
                                  child: Text(
                                    '$animatedCounter',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
            );
          },
        )


      ],
    );
  }
}
