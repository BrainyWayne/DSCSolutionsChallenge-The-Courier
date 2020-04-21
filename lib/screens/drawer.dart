import 'package:delivery/main.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.6,
      color: whiteColor,
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 150,
                width: double.infinity,
                child: Image.asset("assets/images/courier.png", fit: BoxFit.cover,),
              ),
              Container(
                color: white05,
                height: 150,
                width: double.infinity,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("An", style: TextStyle(fontSize: 24, color: blackColor),),
                    Text("Courier", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: blackColor),)
                  ],
                ),
              ),
            ],
          ),

          Divider(
            color: blackColor,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Account",
              style: TextStyle(color: blackColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.account_circle, color: blackColor,),
                SizedBox(width: 10,),
                Text(
                  "Profile",
                  style: TextStyle(color: blackColor, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.favorite, color: blackColor,),
                SizedBox(width: 10,),
                Text(
                  "Favorites",
                  style: TextStyle(color: blackColor, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.fastfood, color: blackColor,),
                SizedBox(width: 10,),
                Text(
                  "Purchases",
                  style: TextStyle(color: blackColor, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "More",
              style: TextStyle(color: blackColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.info, color: blackColor,),
                SizedBox(width: 10,),
                Text(
                  "About",
                  style: TextStyle(color: blackColor, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.settings, color: blackColor,),
                SizedBox(width: 10,),
                Text(
                  "Settings",
                  style: TextStyle(color: blackColor, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.label_outline, color: Colors.red,),
                SizedBox(width: 10,),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
