import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// comment add
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ='loading...';

  setUpWorldTime() async {

    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'india.jpg', url: 'Asia/Kolkata');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
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
      backgroundColor: Colors.grey[400],
      body:Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}
