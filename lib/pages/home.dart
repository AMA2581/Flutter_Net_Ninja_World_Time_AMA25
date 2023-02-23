import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map?;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
        
              Column(
                children: [
                  Text(
                    data!['time'],
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data!['location'],
                        style: TextStyle(
                          fontSize: 20,
                          // letterSpacing: 2,

                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30 ,),
        
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
               ),
               
            ],
          ),
        ),
      ),
    );
  }
}