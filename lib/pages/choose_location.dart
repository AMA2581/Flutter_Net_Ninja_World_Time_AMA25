import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(
          'Choose a location',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        foregroundColor: Colors.blue,
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Text('Choose location screen'),
    );
  }
}