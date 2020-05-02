import 'package:delivery/main.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  @override
  _ItemDetailState createState() => _ItemDetailState();

  String photo;
  String price;
  String text;

  ItemDetail({this.photo, this.price, this.text});
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
            child: Row(
              children: <Widget>[
                GestureDetector(

                  child: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Continental Supermarket",
                  style: TextStyle(color: blackColor, fontSize: 20),
                ),
                Spacer(),
                Icon(
                  Icons.shopping_cart,
                  color: blackColor,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: ListView(
              children: <Widget>[
                Container(
                  child: Image.asset(widget.photo, fit: BoxFit.cover,),
                  width: double.infinity,
                  height: 250,
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(widget.text, style: TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 30,),
                Divider(color: blackColor, thickness: 0.4,),
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.grey.withOpacity(0.4),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(color: blackColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(color: blackColor, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Add To Cart",
                        style: TextStyle(color: primaryColor),
                      ),
                      Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor),
                        child: Text(
                          "Order Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
