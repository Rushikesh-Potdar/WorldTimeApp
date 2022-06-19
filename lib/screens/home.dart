import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  var bgColor = Colors.grey[500];
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
    String bgImage = data['isDayTime'] ? 'Sun.jpg' : 'Moon.jpg';
    var color = data['isDayTime'] ? Colors.grey[800] : Colors.grey[350];
    bgColor = data['isDayTime'] ? Colors.pinkAccent[100] : Colors.black;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,30.0,0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.0,),
                TextButton.icon(
                    onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'location' : result['location'],
                         'flag' : result['flag'],
                         'time' : result['time'],
                         'isDayTime' : result['isDayTime']
                       };
                     });
                    },
                    icon: Icon(Icons.edit_location,color: color,),
                    label: Text('Edit Location',style: TextStyle(
                      color: color,
                    ),)
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: color
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: color
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}
