import 'dart:ui';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? data = {};

  @override
  Widget build(BuildContext context) {

    data = data!.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map?;
    print(data);

    // set background image
    String bgImage = data!['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data!['isDaytime'] ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
          child: Column(
            children: <Widget>[
        
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 300.0,
                      height: 120.0,
                      padding: EdgeInsets.all(10),
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: new BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.2),
                      ),
                      
                      child: Column(
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
                    ),
                  ),
                ),
              ),
      
              SizedBox(height: 30 ,),
        
              // TextButton.icon(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/location');
              //   },
              //   icon: Icon(Icons.edit_location),
              //   label: Text('Edit Location'),
              // ),
               
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          dynamic result = await Navigator.pushNamed(context, '/location');
          setState(() {
            data = {
              'time': result['time'],
              'location': result['location'],
              'isDaytime': result['isDaytime'],
              'flag': result['flag'],
            };
          });
        },
        child: Icon(
          Icons.edit_location,
          ),
      ),
    );
  }
}