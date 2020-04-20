import 'dart:async';

import 'package:delivery/main.dart';
import 'package:delivery/services/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Home.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      checkUser();
    });


    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
        color: whiteColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[


            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/images/courier.png", fit: BoxFit.cover,),
            ),

            Container(
              color: white05,
            ),

            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("An", style: TextStyle(fontSize: 24, color: blackColor),),
                    Text("Courier", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: blackColor),)
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkUser() {
    Auth _auth = new Auth();
    _auth.getCurrentUser().then((onValue) {
      if (onValue != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Login(),
          ),
        );
      }
    });
  }
}
