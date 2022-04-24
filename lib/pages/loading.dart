import 'package:flutter/material.dart';
import 'package:world_time/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time = 'loading';

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getTime(); // wait for the function to finish before carrying out the next one
    print(worldTime.time);
    setState(() {
      // time = worldTime.time;
    });
    Navigator.pushReplacementNamed(context, "/home",arguments:{ // third parameter is a map of data passed to a route
      'location':worldTime.location,
      'flag':worldTime.flag,
      'time':worldTime.time,
      'isDaytime': worldTime.isDaytime,
    }); // push to new page and replace the page underneath
  }

  @override
  void initState() {
    super.initState();
    // getData();
    // getTime();
    setupWorldTime();
  }



  // void getData() async{
  //   // // simulate network request for a username
  //   // // it is non-blocking, which means other functions can still be called at the same time
  //   // // Future.delayed(Duration(seconds: 3),(){
  //   // //   print('Function called after 3 seconds!');
  //   // // }); // trigger delay, takes in duration and a function that fires after the duration
  //   //
  //   // // other functions must wait for this function to end before being called
  //   // String username = await Future.delayed(Duration(seconds: 3),(){
  //   // return 'Quinton';
  //   // }); // trigger delay, takes in duration and a function that fires after the duration
  //   //
  //   // // second function to be waited
  //   // String bio = await Future.delayed(Duration(seconds: 2),(){
  //   // return 'Hardworking';
  //   // }); // trigger delay, takes in duration and a function that fires after the duration
  //   //
  //   // // print('Another function!');
  //   // print(username+' - '+bio);
  //
  //   // from http package
  //   Response res = await get('https://jsonplaceholder.typicode.com/todos/1');
  //   print(res); // returns an instance of 'Response'
  //   Map data = jsonDecode(res.body); // change json data to map
  //   print(data);
  //   print(data['title']);
  // }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Padding(
      //   padding: EdgeInsets.all(50.0),
      //   child:Text(
      //     // time,
      //     "Loading..."
      //   ),
      // ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 80.0,
        )
      )
    );
  }
}
