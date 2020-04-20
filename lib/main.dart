import 'dart:async';

import 'package:clay_containers/clay_containers.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:delivery/screens/splash.dart';
import 'package:delivery/util/globalfunctions.dart';
import 'package:delivery/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}


Color primaryColor =  Color(0xffE8CA12);
Color primaryToWhiteText =  Color(0xffffffff);
Color greyColor = Colors.grey;
Color darkRed =  Color(0xffB30000);
Color whiteColor = Colors.black;
Color blackColor = Colors.white;
Color white05 = Colors.white.withOpacity(0.9);
bool darkModeEnabled = false;


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {




  @override
  void initState() {

    super.initState();
    getDarkMode();
    checkDarkMode();
    setPermissions();


  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: SplashScreen(),
    );


  }

  void checkDarkMode() {

    print(darkModeEnabled.toString());

    if(darkModeEnabled){
       setState(() {
         primaryColor =  Color(0xffE8CA12);
         primaryToWhiteText =  Color(0xffffffff);
         greyColor = Colors.grey;
         darkRed =  Color(0xffB30000);
         whiteColor = Colors.black;
         blackColor = Colors.white;
         white05 = Colors.black.withOpacity(0.9);

       });
    } else if(!darkModeEnabled){
       setState(() {
         primaryColor =  Color(0xffE8CA12);
         primaryToWhiteText =  primaryColor;
         greyColor = Colors.grey;
         darkRed =  Color(0xffB30000);
         whiteColor = Colors.white;
         blackColor = Colors.black;
         white05 = Colors.white.withOpacity(0.9);
       });
    }


  }

  void getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     darkModeEnabled = prefs.getBool('darkmode');

     if(prefs.getBool('darkmode') == null){
      darkModeEnabled = false;
    }

  }

  Future<void> setPermissions() async {
    var status = await Permission.location;

    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
     // Permission.storage,
    ].request();
    print(statuses[Permission.location]);
  }

}
