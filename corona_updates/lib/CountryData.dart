import 'dart:convert';

import 'package:http/http.dart';

class CountryData{

  String slug;
  String confirmed, active, recovered, dead;

  CountryData({this.slug});

  String url;

  Future<Map> getData() async{
    url = 'https://api.covid19api.com/live/country/$slug';


    Response response = await get(url);
    List data = jsonDecode(response.body);

    if (data.isEmpty){

      return {
        'confirmed': '0',
        'active': '0',
        'recovered': '0',
        'dead': '0',
      };

    }else{
      confirmed =  data[0]['Confirmed'].toString();
      active =  data[0]['Active'].toString();
      recovered = data[0]['Recovered'].toString();
      dead = data[0]['Deaths'].toString();

      return {
        'confirmed': confirmed,
        'active': active,
        'recovered': recovered,
        'dead': dead,
      };
    }



  }
}