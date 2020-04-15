import 'dart:async';

import 'package:flutter/material.dart';

import 'Home.dart';
import '../services/firebase_auth.dart';
import 'signup.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

double bottomLoaderHeight = 0;
bool topSnackVisible = false;
String topBannerText = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  @override
  void initState() {
    super.initState();


    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child:
                        Image.asset("assets/cm3.jpeg", fit: BoxFit.cover))),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red.withOpacity(0.3),
                    Colors.orange.withOpacity(0.3)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(60),
                        child: Image.asset("assets/logoonly.png",
                            fit: BoxFit.cover)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    prefixIcon: Icon(Icons.email),
                                    border: InputBorder.none)),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.keyboard),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                              padding: EdgeInsets.all(15),
                              color: Colors.black,
                              onPressed: () {
                                if (emailController.text == "") {
                                  setState(() {
                                    topBannerText = "Enter your email";
                                    topSnackVisible = true;
                                    _hideTopBanner();
                                  });
                                }
                                if (!emailController.text.contains("@")) {
                                  setState(() {
                                    topBannerText = "Enter a valid email";
                                    topSnackVisible = true;
                                    _hideTopBanner();
                                  });
                                } else if (passwordController.text == "") {
                                  setState(() {
                                    topBannerText = "Enter your password";
                                    topSnackVisible = true;
                                    _hideTopBanner();
                                  });
                                } else {
                                  setState(() {
                                    bottomLoaderHeight = 70;
                                  });
                                  Auth _auth = Auth();
  
                                  _auth
                                      .signIn(emailController.text,
                                          passwordController.text)
                                      .then((onValue) {
                                    if(onValue != null){
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)  => Home()));
                                    }
                                  });
                                }
                              },
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("Don't have an account?",
                              style: TextStyle(color: Colors.black)),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: FlatButton(
                              padding: EdgeInsets.all(15),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)  => Signup()));

                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                                 
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Forgot Password?",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: topSnackVisible,
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    topBannerText,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                height: bottomLoaderHeight,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                child: Row(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Signing in...",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  
    void _hideTopBanner() {
      Timer(Duration(seconds: 3), () {
        setState(() {
          topSnackVisible = false;
        });
      });
    }
  

}
