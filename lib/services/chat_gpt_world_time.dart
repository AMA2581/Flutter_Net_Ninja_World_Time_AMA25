import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      http.Response response =
          await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<WorldTime> locations = [
//     WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
//     WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Athens'),
//     WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
//     WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
//     WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
//     WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
//     WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
//     WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
//   ];

//   void updateTime(index) async {
//     WorldTime instance = locations[index];
//     await instance.getTime();
//     // navigate to the home screen
//     Navigator.pop(context);
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => Scaffold(
//                   appBar: AppBar(
//                     title: Text('World Time'),
//                     centerTitle: true,
//                     backgroundColor: Colors.blue[900],
//                   ),
//                   body: Padding(
//                     padding: EdgeInsets.all(50),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           instance.location,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 2,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           instance.time,
//                           style: TextStyle(
//                             fontSize: 66,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Image.network(
//                             'https://worldtimeapi.org/api/timezone/${instance.url.split('/')[0]}/${instance.flag}'),
//                       ],
                   
                   