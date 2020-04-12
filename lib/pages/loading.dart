import 'package:flutter/material.dart';
import 'package:wordtime/pages/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    var worldtime = new WordTime(location: 'Berlin',flag: 'germany.png',url: "Europe/Berlin");
    await worldtime.getData();

    //push result to home screen
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location': worldtime.location,
      'flag': worldtime.flag,
      'time':worldtime.time
    });

  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
              color: Colors.white,
              size: 50.0,
          ),
      ),
    );
  }
}