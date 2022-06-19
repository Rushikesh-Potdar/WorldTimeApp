import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  late String time;
  String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String hrs = data['utc_offset'].substring(1,3);
      String min = data['utc_offset'].substring(4,6);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(hrs), minutes: int.parse(min)));
      //set time property
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour <20 ? true : false;

    }catch(e){
      print('caught error : $e');
      time = 'could not get time data';
    }

  }// getTime()

}
