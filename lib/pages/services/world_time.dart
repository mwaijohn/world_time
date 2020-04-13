import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name from the UI
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getData() async{

    Response response = await get("http://worldtimeapi.org/api/timezone/$url");
    try{
      //
    }catch(e){
      //
    }

    if (response.statusCode == 200) {

      Map jsonResponse = jsonDecode(response.body);

      String datetime = jsonResponse['datetime'];
      String offset = jsonResponse['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

   //find if its night or day
      isDaytime = now.hour > 6 && now.hour<20 ? true: false;
      time = DateFormat.jm().format(now);

    } else {

        print('Request failed with status: ${response.statusCode}.');

    }
  }

}