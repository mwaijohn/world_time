import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //get data from loading screen
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(children: <Widget>[
            FlatButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, "/location");
              },
              icon: Icon(Icons.edit_location),
              label: Text("Edit Location"),
              color: Colors.blue,
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                data['location'],
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 28.0
                ),
                )
            ],),
            SizedBox(height: 20.0,),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66.0
              ),
            )
          ],),
        )
      ),
    );
  }
}