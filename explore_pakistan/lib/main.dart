import 'package:explorepakistan/HomeScreen.dart';
import 'package:explorepakistan/PlaceScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Pakistan',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
        '/placeScreen': (context) => PlaceScreen(),
      },
    );
  }
}

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key,}) : super(key: key);


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void loadData(){

    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.pushReplacementNamed(context, '/home');
    });

  }
  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/loading.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.greenAccent.withOpacity(.8), Colors.green.withOpacity(.7),
                    ]
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('Assets/quiad_small.png'),
                      color: Colors.white,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('EXPLORE', style: TextStyle(fontFamily: "Lato", fontSize: 36.0, color: Colors.white, letterSpacing: 1.3),),
                          Text('PAKISTAN', style: TextStyle(fontFamily: "Lato-Black", fontWeight: FontWeight.bold, fontSize: 36.0, color: Colors.white, letterSpacing: 1.3),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
