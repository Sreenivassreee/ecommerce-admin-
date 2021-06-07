import 'package:flutter/material.dart';
import './global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add_products extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('admin');

    Stream documentStream = FirebaseFirestore.instance
        .collection('admin')
        .doc('Orders')
        .snapshots();

    return Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
      future: users.doc('Product_categories').get(),
      builder: (_, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.done) {
            var d = snapshot.data;
            var data = snapshot.requireData;
            // Map<String, dynamic> data = snapshot.data;
            print(data.data());
            print(d);
          }
        }
        return Text("HI");
      },
    )
        // ListView(
        //   children: [

        //   Expanded(
        //     child: CategeriesCard(
        //     image: "https://cdn.thewirecutter.com/wp-content/uploads/2020/04/laptops-lowres-2x1--1024x512.jpg",
        //     category: "Smartphone",
        //     numOfBrands: 18,

        //   ),),
        //     Expanded(
        //     child: CategeriesCard(
        //     image: "https://cdn.thewirecutter.com/wp-content/uploads/2020/04/laptops-lowres-2x1--1024x512.jpg",
        //     category: "Mobiles",
        //     numOfBrands: 18,

        //   ),),
        //     Expanded(
        //     child: CategeriesCard(
        //     image: "https://l0dl1j3lc42iebd82042pgl2-wpengine.netdna-ssl.com/wp-content/uploads/sites/2/2019/10/FordEV-1200x800.jpeg",
        //     category: "Cars",
        //     numOfBrands: 18,

        //   ),),
        //     Expanded(
        //     child: CategeriesCard(
        //     image: "https://www.incimages.com/uploaded_files/image/1920x1080/getty_883231284_200013331818843182490_335833.jpg",
        //     category: "Books",
        //     numOfBrands: 18,

        //   ),
        //   ),
        // ]),
        );
  }
}
