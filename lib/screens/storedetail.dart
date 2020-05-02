import 'package:delivery/main.dart';
import 'package:delivery/screens/itemdetail.dart';
import 'package:flutter/material.dart';

class StoreDetail extends StatefulWidget {
  @override
  _StoreDetailState createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: whiteColor,
        child: Stack(
          children: <Widget>[
            Container(
              color: whiteColor,
              padding: const EdgeInsets.only(left: 8, top: 30, bottom: 8),
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: blackColor,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continental Supermarket",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70, left: 8, right: 8),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
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
                      tag: "photo",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Ayeduase Gate",
                          style: TextStyle(color: blackColor),
                        ),

                        Text(" | ", style: TextStyle(color: blackColor),),
                        Text("Mon - Fri: 6am - 9pm",style: TextStyle(color: blackColor),)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Most Popular Products",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                              fontSize: 22),
                        ),
                        Spacer(),
                        Text("See all", style: TextStyle(color: blackColor),)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ItemDetail(photo: "assets/images/facemasks.jpg", price: "Ghc42.00", text: "Box of Disposable Face Masks",)));
                              },
                              child: Container(

                                width: 200,
                                height: 220,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      child: Container(
                                        child: Image.asset(
                                          "assets/images/facemasks.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                        height: 120,
                                        width: double.infinity,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "GHS 42.00",
                                      style: TextStyle(
                                          color: blackColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Box of Disposable Face Masks",
                                      style: TextStyle(color: blackColor),
                                    ),

                                  ],
                                ),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: blackColor, width: 0.3)
                                ),


                              ),
                            ),

                            SizedBox(width: 20,),

                            Container(

                              width: 200,
                              height: 220,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    child: Container(
                                      child: Image.asset(
                                        "assets/images/toiletpaper.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      height: 120,
                                      width: double.infinity,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "GHS 10.00",
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Pack of Toilet Paper",
                                    style: TextStyle(color: blackColor),
                                  ),

                                ],
                              ),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: blackColor, width: 0.3)
                              ),


                            ),

                            SizedBox(width: 20,),

                            Container(

                              width: 200,
                              height: 220,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    child: Container(
                                      child: Image.asset(
                                        "assets/images/sanitizer.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      height: 120,
                                      width: double.infinity,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "GHS 5.00",
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Hand Sanitizer",
                                    style: TextStyle(color: blackColor),
                                  ),

                                ],
                              ),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: blackColor, width: 0.3)
                              ),


                            ),



                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
