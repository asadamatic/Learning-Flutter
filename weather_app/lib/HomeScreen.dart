import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather_library.dart';

class HomeScreen extends StatefulWidget {


  @override
  State createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>{

  Map data = {};
  Weather weather;
  List<Weather> weatherForecast;

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    weather = data['weather'];
    weatherForecast = data['weatherForecast'];
    return Scaffold(


    );
  }
}