import 'dart:convert';

import 'package:http/http.dart';


class WorldData {

  String confirmed, active, recovered, dead;

  WorldData();

  String url;

  Future<Map> getData() async{

    url = 'https://api.covid19api.com/world/total';

    Response response = await get(url);
    Map data = jsonDecode(response.body);
    confirmed =  data['TotalConfirmed'].toString();
    recovered = data['TotalRecovered'].toString();
    dead = data['TotalDeaths'].toString();

    return {
      'confirmed': confirmed,
      'recovered': recovered,
      'dead': dead,
    };
  }

}