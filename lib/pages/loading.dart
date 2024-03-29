import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:net_ninja_world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String? time = 'loading';

  void setupWorldTime() async{
    WorldTime instance = 
      WorldTime(location: 'Tehran', flag: 'iran.png', url: 'Asia/Tehran');
    await instance.getTime();
    // print(instance.time);
    if(instance.time == 'Could not get time data'){
      goToNoInternet();
    } else {
      goToHome(instance);
    }
  }  

  void goToHome(WorldTime instance){
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  void goToNoInternet(){
    Navigator.pushReplacementNamed(context, '/noInternet');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$time',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SpinKitThreeBounce(
                color: Colors.black,
                size: 30.0,
              ),
            ],
          ),
        ),
        ),
    );
  }
}