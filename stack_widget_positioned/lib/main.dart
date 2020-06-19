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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('Assets/image.jpg')
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 50.0,
                    height: 80.0,
                    right: 50.0,
                    left: 50.0,
                    child: Container(
                      child: Image(
                        image: AssetImage('Assets/icon.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 60.0,
                    bottom: -30.0,
                    right: 0.0,
                    left: 0.0,
                    child: Card(
                      elevation: 10.0,
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        color: Colors.white,
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search here...',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 50.0,
                  ),
                  Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.redAccent,
                      height: 200.0,
                      child: Stack(
                        fit: StackFit.expand,
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Image(
                            image: AssetImage('Assets/image.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                  margin: EdgeInsets.only(left: 10.0, bottom: 5.0,),
                                  child: Text('Mountains', style: TextStyle(color: Colors.white, fontSize: 24.0,),)
                              ),
                          ),
                          Positioned(
                            bottom: -30.0,
                            left: 10.0,
                            child: Container(
                              child: Text('Mountains are huge.', style: TextStyle(color: Colors.black, fontSize: 20.0,),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.redAccent,
                      height: 200.0,
                      child: Stack(
                        fit: StackFit.expand,
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Image(
                            image: AssetImage('Assets/image.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                margin: EdgeInsets.only(left: 10.0, bottom: 5.0,),
                                child: Text('Mountains', style: TextStyle(color: Colors.white, fontSize: 24.0,),)
                            ),
                          ),
                          Positioned(
                            bottom: -30.0,
                            left: 10.0,
                            child: Container(
                              child: Text('Mountains are huge.', style: TextStyle(color: Colors.black, fontSize: 20.0,),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.redAccent,
                      height: 200.0,
                      child: Stack(
                        fit: StackFit.expand,
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Image(
                            image: AssetImage('Assets/image.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                margin: EdgeInsets.only(left: 10.0, bottom: 5.0,),
                                child: Text('Mountains', style: TextStyle(color: Colors.white, fontSize: 24.0,),)
                            ),
                          ),
                          Positioned(
                            bottom: -30.0,
                            left: 10.0,
                            child: Container(
                              child: Text('Mountains are huge.', style: TextStyle(color: Colors.black, fontSize: 20.0,),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ]
              ),
            )
          ],
        ),


      ),
    );
  }
}
