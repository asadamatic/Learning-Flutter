import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class LoadingScreen extends StatefulWidget{


  @override
  State createState() {
    return _LoadingScreen();
  }
}

class _LoadingScreen extends State<LoadingScreen>{


  void getData() async{
    
    Response response = await get("http://worldtimeapi.org/api/timezone/Asia/Karachi");
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    DateTime date = DateTime.parse(datetime);
    date = date.add(Duration(hours: int.parse(offset)));

    Response europe_response = await get("http://worldtimeapi.org/api/timezone/Europe/London");
    Map europe_data = jsonDecode(response.body);
    String europe_datetime = data['datetime'];
    String europe_offset = data['utc_offset'].substring(1, 3);

    DateTime europe_date = DateTime.parse(datetime);
    europe_date = date.add(Duration(hours: int.parse(offset)));

    print(date.timeZoneName);
    print(date.compareTo(europe_date));

    europe_date = europe_date.subtract(Duration(hours: 5));

    print(date.compareTo(europe_date));

  }
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }
}