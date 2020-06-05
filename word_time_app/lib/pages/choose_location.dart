import 'package:flutter/material.dart';
import 'package:wordtimeapp/Services/WorlTime.dart';
class ChooseLocation extends StatefulWidget{

  @override
  State createState() {
    return _ChooseLocation();
  }
}

class _ChooseLocation extends State<ChooseLocation>{

  String text = 'Hi there!';

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[20],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context , index){
            return Card(
              child: ListTile(
                onTap: () async{
                  await locations[index].getTime();
                  Navigator.pop(context, {
                    'location': locations[index].location,
                    'flag' : locations[index].flag,
                    'time' : locations[index].time,
                    'isDayTime': locations[index].isDayTime
                  });
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('Assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            );
      }),
    );
  }
}