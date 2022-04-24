import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // exclamation mark operator throws error if the value is null ( null safety )
    // data is not overwritten when we choose a new location
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map; // returns data passed by other routes and it is casted into Map type

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.lightBlue : Colors.black45;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:AssetImage(
                  'assets/$bgImage',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding:EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children:<Widget>[
                  FlatButton.icon(
                    onPressed: ()async{
                      // it pushes another screen on top of it, the initial screen is still underneath
                      // waits for data from the chooseLocation page and puts it into result
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState((){
                        data = {
                          'location':result['location'],
                          'flag':result['flag'],
                          'time':result['time'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                      },
                    icon:Icon(
                        Icons.edit_location,
                        color:data['isDaytime']?Colors.black:Colors.white,
                    ),
                    label:Text(
                        'Edit location',
                        style:TextStyle(
                          color:data['isDaytime']?Colors.black:Colors.white,
                        ),
                    ),
                  ),
                  SizedBox(
                    height:20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style:TextStyle(
                          fontSize:28.0,
                          letterSpacing: 2.0,
                          color:data['isDaytime']?Colors.black:Colors.white,
                        )
                      )
                    ]
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color:data['isDaytime']?Colors.black:Colors.white,
                    )
                  )
                  ]
              ),
            ),
          ), // safe area prevents text from hiding behind nofitication bar
      ),
    );;
  }
}
