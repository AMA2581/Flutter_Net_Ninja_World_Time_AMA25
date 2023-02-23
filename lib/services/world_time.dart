import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDaytime;

  WorldTime ({ required this.location, required this.flag, required this.url});

  Future <void> getTime() async {
    try{
      // make the request
      http.Response response = 
        await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
      
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }


}