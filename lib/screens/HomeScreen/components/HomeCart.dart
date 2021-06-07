import 'package:flutter/material.dart';

class HomeCart extends StatelessWidget {
  int? numOfThings;
  String? thingName;
  GestureTapCallback? press;

  HomeCart({this.thingName, this.numOfThings, @required this.press});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth / 2.5,
      width: screenWidth / 2.5,
      child: InkWell(
        onTap: press,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$numOfThings",
                style: TextStyle(fontSize: 35),
              ),
              Text(
                "$thingName",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
