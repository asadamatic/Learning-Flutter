import 'package:coronaupdates/CountryData.dart';
import 'package:coronaupdates/HomeScreen.dart';
import 'package:coronaupdates/WorldData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Updates',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class LoadingScreen extends StatefulWidget{

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<String> countries = List();
  List<Map<String, String>> countryMap = [];
  Map worldMap = {};
  Future<http.Response> response;
  String country;
  String option = 'Country';

  void loadData() async{

    response = http.get('https://api.covid19api.com/countries');
    response.then((value) async{
      List data = jsonDecode(value.body);
      data.forEach((element) {
        countryMap.add({'Country':"${element['Country']}" , 'Slug' : "${element['Slug']}"});
      });
      countryMap.forEach((element) => countries.add(element['Country']));
      country = countryMap[0]['Country'];

      CountryData countryData = CountryData(slug: "${countryMap[0]['Slug']}");
      Map patientData = await countryData.getData();

      WorldData worldData = WorldData();
      worldMap = await worldData.getData();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'countryMap': countryMap,
        'countries': countries,
        'country': country,
        'patientData': patientData,
        'worldMap': worldMap,
      });

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 10.0),
              duration: Duration(seconds: 3),
              builder: (BuildContext context, double rotation, Widget child){

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(rotation, rotation+rotation),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Transform.rotate(
                            angle: rotation+5,
                            origin: Offset(10.0, 10.0),
                            child: Image(
                              image: AssetImage('Assets/icon.png'),
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                          Transform.rotate(
                            angle: rotation-5,
                            origin: Offset(10.0, 10.0),
                            child: Image(
                              image: AssetImage('Assets/icon.png'),
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: rotation,
                      origin: Offset(50.0, 50.0),
                      child: Image(
                        image: AssetImage('Assets/icon.png'),
                        height: 200.0,
                        width: 200.0,
                      ),
                    ),
                    Transform.rotate(
                      angle: rotation-5,
                      origin: Offset(-25.0, 0.0),
                      child: Image(
                        image: AssetImage('Assets/icon.png'),
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                  ],
                );
              },
            ),
            SpinKitThreeBounce(
              color: Colors.indigo,
            )
          ],
        ),
      ),
    );
  }
}
