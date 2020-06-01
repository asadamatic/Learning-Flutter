import 'package:flutter/material.dart';
import 'package:wordtimeapp/pages/home.dart';
import 'package:wordtimeapp/pages/loading_screen.dart';
import 'package:wordtimeapp/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
