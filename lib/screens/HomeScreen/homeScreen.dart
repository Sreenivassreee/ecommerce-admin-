import 'package:admin_for_e_commerce/screens/HomeScreen/components/HomeCart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(title: Text("Total Revenue"),
                subtitle: Text("2,45,545",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                trailing: CircleAvatar(child: Icon(Icons.arrow_upward)),
                
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCart(
                    numOfThings: 200,
                    thingName: "Oders",
                    press: () {
                      print("Orderds");
                    },
                  ),
                  HomeCart(
                    numOfThings: 100,
                    thingName: "Pending Orders",
                       press: () {
                      print("Pending Orders");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCart(
                    numOfThings: 150,
                    thingName: "Oders",
                       press: () {
                      print("Orderds");
                    },
                  ),
                  HomeCart(
                    numOfThings: 200,
                    thingName: "Delevered Orders",
                       press: () {
                      print("Orderds");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
