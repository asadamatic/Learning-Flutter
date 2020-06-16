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

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Stack(

          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                color: Colors.white.withOpacity(.7)
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(50.0),
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                  color: Colors.greenAccent,
                  child: Text('Sign Up', style: TextStyle(fontSize: 18.0,),),
                  textColor: Colors.blueGrey,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 100.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("It's time to start materializing your dreams", style: TextStyle(fontSize: 40.0, color: Colors.indigoAccent, fontWeight: FontWeight.bold),),
                    Text("We are here to help to, move forward.", style: TextStyle(fontSize: 20.0, color: Colors.blueGrey,),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
