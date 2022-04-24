import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/chooseLocation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home:Home(), // will throw an error due to conflict
      initialRoute: '/',
      routes: { // A map
        '/':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/location':(context)=>ChooseLocation(),
      },
    );
  }
}

