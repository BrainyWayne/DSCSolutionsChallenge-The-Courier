import 'dart:async';

import 'package:delivery/services/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Home.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

double pulseValue;
double pulseValueGrey;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      checkUser();
    });

    pulseIn();

    super.initState();
  }

  void pulseOut() {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        setState(() {
          pulseValue = 160;
          pulseValueGrey = 250;
        });
      });
      pulseIn();
    });
  }

  void pulseIn() {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        setState(() {
          pulseValue = 250;
          pulseValueGrey = 160;
        });
      });
      pulseOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset("assets/book.png", fit: BoxFit.cover))),
            Container(
              color: Colors.white.withOpacity(0.9),
            ),
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                height: pulseValue,
                width: pulseValue,
                child: Image.asset(
                  "assets/profrancologo.png",
                ),
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
