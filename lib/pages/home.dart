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
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //set background image
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, "/location");
                  setState(() {
                        data = {
                          'location': result['location'],
                          'flag': result['flag'],
                          'time': result['time'],
                          'isDaytime': result['isDaytime']
                        };
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text(
                  "Edit Location",
                  style: TextStyle(
                    color: Colors.grey[300]
                    ),
                  ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(letterSpacing: 2.0, fontSize: 28.0,color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66.0,color: Colors.white),
              )
            ],
          ),
        ),
      )),
    );
  }
}
