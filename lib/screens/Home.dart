import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:delivery/screens/splash.dart';
import 'package:delivery/services/firebase_auth.dart';
import 'package:delivery/util/globalfunctions.dart';
import 'package:delivery/util/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../main.dart';



class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _mapStyle;
  Position position;

  Color regularColor = primaryColor;
  Color expressColor = greyColor;
  Color scheduleColor = greyColor;
  Color regularBarColor = primaryColor;
  Color expressBarColor = greyColor;
  Color scheduleBarColor = greyColor;
  Color regularTextColor = blackColor;
  Color expressTextColor = greyColor;
  Color scheduleTextColor = greyColor;
  Color mainButtonColor = primaryColor;
  Color mainButtonTextColor = Colors.black;
  var longitude;
  var latitude;

  String darkModeText = "off";

  double profileContainerHeight = 0;

  bool switchVal = false;

  String username;
  String email;
  String photoUrl;
  String number;


  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );



  @override
  void initState() {
    super.initState();
    switchVal = darkModeEnabled;
    rootBundle.loadString('assets/mapstyle.txt').then((string) {
      _mapStyle = string;
    });

    getCurrentLocation();
    getUserInfo();


  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              trafficEnabled: true,
              buildingsEnabled: true,
              mapToolbarEnabled: true,
              myLocationButtonEnabled: true,
              indoorViewEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);


               // controller.setMapStyle(_mapStyle);
              },
            ),
             height: MediaQuery.of(context).size.height - 145,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(

                          child: Column(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                    color: expressBarColor,
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                height: 3,
                                width: 100,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 40,
                                    child: Image.asset("assets/images/express.png", color: expressColor,),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("EXPRESS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: expressTextColor),)
                                ],
                              ),
                            ],
                          ),
                          onTap: (){
                            deliveryMode(EXPRESS);
                          },
                        ),
                        GestureDetector(
                          onTap: (){
                            deliveryMode(REGULAR);
                          },
                          child: Column(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                    color: regularBarColor,
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                height: 3,
                                width: 100,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 30,
                                    child: Image.asset("assets/images/regular.png", color: regularColor,),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("REGULAR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: regularTextColor),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            deliveryMode(SCHEDULE);
                          },
                          child: Column(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                    color: scheduleBarColor,
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                height: 3,
                                width: 100,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 30,
                                    child: Image.asset("assets/images/schedule.png", color: scheduleColor,),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("SCHEDULE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: scheduleTextColor),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              profileContainerHeight = MediaQuery.of(context).size.height;
                            });
                          },
                          child: ClayContainer(
                            curveType: CurveType.concave,
                            depth: 20,
                            borderRadius: 50,
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/images/1.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 45,
                              width: 45,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                              horizontal: 55, vertical: 12),
                          decoration: BoxDecoration(
                              color: mainButtonColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.filter_center_focus, color: mainButtonTextColor,),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "MAKE REQUEST",
                                style: TextStyle(fontWeight: FontWeight.bold, color: mainButtonTextColor),
                              )
                            ],
                          ),
                        ),
                        ClayContainer(
                          curveType: CurveType.convex,
                          depth: 20,
                          borderRadius: 50,
                          child: Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Icon(Icons.grain)),
                            height: 45,
                            width: 45,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.menu, color: blackColor,),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: (){
                _currentLocation(latitude, longitude);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 170, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: whiteColor
                ),
                child: Icon(Icons.location_on, color: blackColor,),
                height: 50,
                width: 50,
              ),
            ),
          ),
          AnimatedContainer(
            height: profileContainerHeight,
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
                color: white05
            ),
            child: Container(

              decoration: BoxDecoration(
                // color: whiteColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(imageUrl: photoUrl, fit: BoxFit.cover,),
                      ),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(username, style: TextStyle(color: blackColor, fontSize: 22, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(email, style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(number, style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.home, color: blackColor,),
                          SizedBox(width: 15,),
                          Text("Add Home", style: TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),),
                          Spacer(),
                          Icon(Icons.chevron_right, color: blackColor,),

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.wb_sunny, color: blackColor,),
                          SizedBox(width: 15,),
                          Text('Dark mode ', style: TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),),
                          Spacer(),
                          CustomSwitch(
                            activeColor: primaryColor,
                            value: switchVal,
                            onChanged: (value) {
                              print("$value");
                              setState(() {
                                switchVal = value;
                                onSwitchValueChanged(switchVal);
                              });
                            },
                          ),
                          SizedBox(height: 12.0,),

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    GestureDetector(
                      onTap: (){
                        Auth auth = new Auth();
                        auth.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
                      },
                      child: Container(

                        decoration: BoxDecoration(
                            color: darkRed,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              profileContainerHeight = 0;
                            });
                          },
                          child: Container(

                            decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text("Cancel", style: TextStyle(color: primaryToWhiteText, fontWeight: FontWeight.bold),),
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                          ),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyApp()));
                          },
                          child: Container(

                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text("Save", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),
    );


  }

  Future<void> _currentLocation(double longitude, double latitude) async {

     final CameraPosition currentLocation = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(longitude, latitude),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentLocation));
  }

  void deliveryMode(String mode){
    switch (mode){
      case EXPRESS:{

        setState(() {
          expressColor = darkRed;
          expressTextColor = blackColor;
          expressBarColor = darkRed;
          mainButtonColor = darkRed;
          mainButtonTextColor = Colors.white;

          //Others
          regularTextColor = Colors.grey;
          regularColor = Colors.grey;
          regularBarColor = Colors.white;
          scheduleBarColor = Colors.white;
          scheduleTextColor = Colors.grey;
          scheduleColor = Colors.grey;
        });
        break;
      }

      case REGULAR:{

        setState(() {
          regularColor = primaryColor;
          regularTextColor = blackColor;
          regularBarColor = primaryColor;
          mainButtonColor = primaryColor;
          mainButtonTextColor = Colors.black;

          //Others
          expressTextColor = Colors.grey;
          expressBarColor = Colors.white;
          scheduleBarColor = Colors.white;
          expressColor = Colors.grey;
          scheduleColor = Colors.grey;
          scheduleTextColor = Colors.grey;
        });

        break;
      }

      case SCHEDULE:{

        setState(() {
          scheduleTextColor = blackColor;
          scheduleColor = primaryColor;
          scheduleBarColor = primaryColor;
          mainButtonColor = primaryColor;
          mainButtonTextColor = Colors.black;

          //Others
          expressColor = Colors.grey;
          expressBarColor = Colors.white;
          regularBarColor = Colors.white;
          expressTextColor = Colors.grey;
          regularColor = Colors.grey;
          regularTextColor = Colors.grey;;
        });

        break;
      }



    }


  }

  void onSwitchValueChanged(bool darkMode){
    darkModeEnabled = darkMode;

  }

  Future<void> getCurrentLocation() async {
   position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   longitude = position.longitude;
   latitude = position.latitude;
   print(position);

   _currentLocation(latitude, longitude);
  }

  Future<void> getUserInfo() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    DocumentReference documentReference =
    Firestore.instance.collection('users').document(user.uid);

    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        print(datasnapshot.data['email'].toString());
        print(datasnapshot.data['name'].toString());
        print(datasnapshot.data['residence'].toString());
        var photolink;
        try {
          photolink = datasnapshot.data['photo'].toString();
        } catch (e) {
          photoUrl = "N/A";
        }

        setState(() {
          username = datasnapshot.data['name'].toString();
          email = datasnapshot.data['email'].toString();
          photoUrl = photolink;

          number = datasnapshot.data['phone'].toString();
        });
      }
    });
  }


}





