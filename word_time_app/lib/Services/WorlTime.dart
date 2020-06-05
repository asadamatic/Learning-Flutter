import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  String location //Location shown on UI
  , time //Time for the above location,
  , flag//url for location(country) flag
  , url; //url to api end point
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{

    try{
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 5 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(error){
      time = 'Could get time data';
    }
  }
}
