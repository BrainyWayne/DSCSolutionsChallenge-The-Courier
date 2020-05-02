import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:delivery/main.dart';
import 'package:delivery/screens/storedetail.dart';
import 'package:flutter/material.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        color: whiteColor,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Icon(
                Icons.grain,
                size: 500,
                color: blackColor,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: white05,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nearby stores",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: blackColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StoreDetail()));
                      },
                      child: Hero(
                        tag: "photo",
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/images/shop.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Continental Supermarket",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ayeduase Gate",
                      style: TextStyle(color: blackColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/images/shop.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Continental Supermarket",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ayeduase Gate",
                      style: TextStyle(color: blackColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StoreDetail()));
                      },
                      child: Hero(
                        tag: "photo1",
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/images/shop.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Continental Supermarket",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ayeduase Gate",
                      style: TextStyle(color: blackColor),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: whiteColor,
              padding: const EdgeInsets.only(left: 8, top: 30, bottom: 8),
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.grain,
                        color: blackColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Stores",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
