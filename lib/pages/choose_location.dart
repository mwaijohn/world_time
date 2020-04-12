import 'package:flutter/material.dart';


class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blueAccent,
          onPressed:(){
            setState(() {
              counter += 1;
            });
          },
          child: Text("Counter is $counter",style: TextStyle(color: Colors.white),) ,
        )
      )
    );
  }
}