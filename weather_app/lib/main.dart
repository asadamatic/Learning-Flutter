import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather_library.dart';
import 'package:weatherapp/HomeScreen.dart';

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
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<Offset> animation;

  WeatherStation weatherStation = WeatherStation('eb4fdd6ba32007915f8e4ff410e33e52');
  Weather weather;
  Position position;
  Coordinates coordinates;
  List<Address> address;
//  LocationOptions locationOptions;
//  StreamSubscription<Position> streamSubscription;
  void getWeahter() async{
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    coordinates = Coordinates(position.latitude, position.longitude);
    address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print('${address.first.adminArea.split(' ')[0]} ____________________________________________________');
    weather = await weatherStation.currentWeather(position.latitude, position.longitude);

    List<Weather> weatherForecast = await weatherStation.fiveDayForecast(position.latitude, position.longitude);



//    locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
//    streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position newPosition) {
//
//      position = newPosition != null ? newPosition : position;
//    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeahter();
    animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.5, 0.0)
    ).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              position: animation,
              child: Image(
                image: AssetImage('Assets/welcome.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TweenAnimationBuilder(
                  tween: Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 5.0),),

                  duration: Duration(seconds: 1),
                  builder: (context, offset, child){

                    return Transform.translate(
                        offset: offset,
                        child: Text('WEATHER', textAlign: TextAlign.left, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: "Lato-Black"),));
                  },
                ),
                TweenAnimationBuilder(
                  tween: Tween<Offset>(begin: Offset(0.0, 10.0), end: Offset.zero,),

                  duration: Duration(seconds: 1),
                  builder: (context, offset, child){

                    return Transform.translate(
                        offset: offset,
                        child: Text('FORECAST', textAlign: TextAlign.left, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: "Lato-Black"),));
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

}
