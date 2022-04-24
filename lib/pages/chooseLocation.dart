import 'package:flutter/material.dart';
import 'package:world_time/services/worldTime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  // runs once when the page loads
  @override
  void initState() {
    super.initState();
    // print('initState function ran!');
    // getData();
    // print('Hello World!'); // it won't wait for the await functions as it is out of the scope
  }

  void updateTime(index) async{
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    // navigate to home screen
    // remove current page off the stack and return to previous page underneath
    Navigator.pop(context,{
      'location':worldTime.location,
      'flag':worldTime.flag,
      'time':worldTime.time,
      'isDaytime': worldTime.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {

    // runs when the widget rebuilds, for example after setState() function is called
    // print('build function ran!');

    return Scaffold(
      // if we are using appBar, we don't need safe area as it pushes the body downwards
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      // body: Text('Choose Location Screen'),
      body: ListView.builder( // iterates through a list and builds widgets
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child:ListTile(
                onTap:(){
                  // print(locations[index].location);
                  updateTime(index);
                },
                title:Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${locations[index].flag}',
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
