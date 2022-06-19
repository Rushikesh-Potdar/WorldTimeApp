import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations = [
    WorldTime(location: 'Phoenix', flag: 'Phoenix.jpg', url: 'America/Phoenix'),
    WorldTime(location: 'St_Johns', flag: 'Florida.png.png', url: 'America/St_Johns'),
    WorldTime(location: 'Kolkata', flag: 'India.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'Tokyo', flag: 'Japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Stanley', flag: 'Canada.png', url: 'Atlantic/Stanley'),
    WorldTime(location: 'Sydney', flag: 'Australia.png', url: 'Australia/Sydney'),
    WorldTime(location: 'Phoenix', flag: 'Phoenix.jpg', url: 'America/Phoenix'),
    WorldTime(location: 'St_Johns', flag: 'Florida.png.png', url: 'America/St_Johns'),
    WorldTime(location: 'Kolkata', flag: 'India.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'Tokyo', flag: 'Japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Stanley', flag: 'Canada.png', url: 'Atlantic/Stanley'),
    WorldTime(location: 'Sydney', flag: 'Australia.png', url: 'Australia/Sydney')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                updateTime(index);
                //Navigator.pop(context);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void updateTime(index) async{
    WorldTime wt = locations[index];
    await wt.getTime();
    Navigator.pop(context,{
      'location' : wt.location,
      'flag' : wt.flag,
      'time' : wt.time,
      'isDayTime' : wt.isDayTime
    });
  }
}
