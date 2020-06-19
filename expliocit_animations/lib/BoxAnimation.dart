import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxAnimation extends StatefulWidget{


  @override
  State createState() {
    return BoxAnimationState();
  }
}

class BoxAnimationState extends State<BoxAnimation> with TickerProviderStateMixin{
  AnimationController animationControllerOne, animationControllerTwo, animationControllerThree,
                      animationControllerFour, animationControllerFive, animationControllerSix,
                      animationControllerSeven, animationControllerEight, animationControllerNine;

  void getAnimation() async{

    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerOne.forward();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerTwo.forward();
      animationControllerFour.forward();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {

      animationControllerThree.forward();
      animationControllerFive.forward();
      animationControllerSeven.forward();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerSix.forward();
      animationControllerEight.forward();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerNine.forward();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerOne.reverse();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerTwo.reverse();
      animationControllerFour.reverse();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {

      animationControllerThree.reverse();
      animationControllerFive.reverse();
      animationControllerSeven.reverse();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerSix.reverse();
      animationControllerEight.reverse();
    });
    await Future.delayed(Duration(milliseconds: 175)).then((value) {
      animationControllerNine.reverse();
    });

    getAnimation();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationControllerOne = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerTwo = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerThree = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerFour = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerFive = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerSix = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerSeven = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerEight = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );
    animationControllerNine = AnimationController(
      duration: Duration(milliseconds: 175),
      vsync: this,
    );

    getAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedBuilder(
                  animation: animationControllerOne,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerOne.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: animationControllerTwo,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerTwo.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: animationControllerThree,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerThree.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedBuilder(
                  animation: animationControllerFour,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerFour.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: animationControllerFive,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerFive.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: animationControllerSix,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerSix.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedBuilder(
                  animation: animationControllerSeven,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerSeven.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: animationControllerEight,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerEight.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: animationControllerNine,
                  child:  Container(
                    color: Colors.red,
                    height: 20.0,
                    width: 20.0,
                  ),
                  builder: (context, child){

                    return Transform.scale(
                      scale: animationControllerNine.value * 1 + .2,
                      child: child,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}