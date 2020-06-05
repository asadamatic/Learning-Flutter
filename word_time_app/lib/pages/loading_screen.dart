import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wordtimeapp/Services/WorlTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget{

  @override
  State createState() {
    return _LoadingScreen();
  }
}

class _LoadingScreen extends State<LoadingScreen>{

  void setTime() async{
    WorldTime instance = WorldTime(location: 'Pakistan', flag: 'pakistan.png', url: 'Asia/Karachi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
          child: SpinKitPouringHourglass(
            color: Colors.blue,
          )
          )
      ),
    );
  }
}