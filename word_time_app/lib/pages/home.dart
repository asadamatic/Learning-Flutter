import 'package:flutter/material.dart';

class Home extends StatefulWidget{


  @override
  State createState() {
    return _Home();
  }
}

class _Home extends State<Home>{

  Map worldTimeData = {};

  @override
  Widget build(BuildContext context) {

    worldTimeData = worldTimeData.isNotEmpty ? worldTimeData : ModalRoute.of(context).settings.arguments;
    String backgroundImage = worldTimeData['isDayTime'] ? 'Assets/day.png' : 'Assets/night.png';
    Color backgroundColor = worldTimeData['isDayTime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Center(
                  child: FlatButton.icon(onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');

                    setState(() {
                      worldTimeData = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                },
                    icon: Icon(
                      Icons.edit_location,
                    ),
                    label: Text('Edit Location', style: TextStyle(letterSpacing: 1.2),),
                    textColor: Colors.white,
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: Text(worldTimeData['location'], style: TextStyle(fontSize: 30.0, color: Colors.white),),
              ),
              SizedBox(height: 25.0),
              Center(
                child: Text(worldTimeData['time'], style: TextStyle(fontSize: 50, color: Colors.white),),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }


}