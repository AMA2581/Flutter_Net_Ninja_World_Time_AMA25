import 'package:flutter/material.dart';
import 'package:net_ninja_world_clock/pages/choose_location.dart';
import 'package:net_ninja_world_clock/pages/loading.dart';
import 'package:net_ninja_world_clock/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
