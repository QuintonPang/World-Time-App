import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the UI
  String time = ''; // the time in the location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime = true; // true if it is day, false if it is night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void>getTime() async{
    // error handling
    try{
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3); // extract character no.1 and no.2
      // print(datetime);
      // print(offset);

      // create datetime object
      DateTime now = DateTime.parse(datetime); // changes to datetime object
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      // check if the time is daytime
      isDaytime = now.hour>6 && now.hour<20 ? true : false;

      // set time property
      // time = now.toString();

      // format time into more readable format ( **:** AM/PM )
      time = DateFormat.jm().format(now);


    }catch(e){
      print('Error: $e');
      time = 'Failed to get time data.';
    }
  }
}