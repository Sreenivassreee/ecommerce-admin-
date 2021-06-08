import 'package:admin_for_e_commerce/screens/HomeScreen/AddProductPage/componets/AddEachProductPage.dart';
import 'package:admin_for_e_commerce/screens/Services/firebase/firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add_products extends StatefulWidget {
  @override
  _Add_productsState createState() => _Add_productsState();
}

class _Add_productsState extends State<Add_products> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void navigate(context, categoryName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddEachProductsPage(
                  categetyName: categoryName,
                )));
  }

  FullScreenDialog _myDialog = new FullScreenDialog();

  Fire f = Fire();
  List dataList = [];
  @override
  void initState() {
    super.initState();

    print("Read Called");
  }

  getData() {
    f.readCategory().then((value) => setState(() {
          dataList = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              child: Expanded(
                  child: FutureBuilder(
                      future: getData(),
                      builder: (BuildContext context, data) {
                        return data != null
                            ? ListView.builder(
                                itemCount: dataList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CategeriesCard(
                                    image:
                                        dataList[index]['url'],
                                    category: dataList[index]['name'],
                                    numOfBrands: 18,
                                    ontap: () {
                                      navigate(context, "SmartPhone");
                                    },
                                  );
                                })
                            : Center(child: CircularProgressIndicator());
                      })

                  // ListView.builder(
                  //   itemCount: dataList.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //   return     CategeriesCard(
                  //     image:
                  //         "https://cdn.thewirecutter.com/wp-content/uploads/2020/04/laptops-lowres-2x1--1024x512.jpg",
                  //     category: "Smartphone",
                  //     numOfBrands: 18,
                  //     ontap: () {
                  //       navigate(context, "SmartPhone");
                  //     },
                  //   );
                  // }),
                  // child: ListView(

                  //   shrinkWrap: true, children: [
                  // CategeriesCard(
                  //   image:
                  //       "https://cdn.thewirecutter.com/wp-content/uploads/2020/04/laptops-lowres-2x1--1024x512.jpg",
                  //   category: "Smartphone",
                  //   numOfBrands: 18,
                  //   ontap: () {
                  //     navigate(context, "SmartPhone");
                  //   },
                  // ),
                  //   CategeriesCard(
                  //     image:
                  //         "https://cdn.thewirecutter.com/wp-content/uploads/2020/04/laptops-lowres-2x1--1024x512.jpg",
                  //     category: "Mobiles",
                  //     numOfBrands: 18,
                  //     ontap: () {
                  //       navigate(context, "Mobiles  ");
                  //     },
                  //   ),
                  //   CategeriesCard(
                  //     image:
                  //         "https://l0dl1j3lc42iebd82042pgl2-wpengine.netdna-ssl.com/wp-content/uploads/sites/2/2019/10/FordEV-1200x800.jpeg",
                  //     category: "Cars",
                  //     numOfBrands: 18,
                  //     ontap: () {},
                  //   ),
                  //   CategeriesCard(
                  //     image:
                  //         "https://www.incimages.com/uploaded_files/image/1920x1080/getty_883231284_200013331818843182490_335833.jpg",
                  //     category: "Books",
                  //     numOfBrands: 18,
                  //     ontap: () {},
                  //   ),
                  //   CategeriesCard(
                  //     image:
                  //         "https://www.incimages.com/uploaded_files/image/1920x1080/getty_883231284_200013331818843182490_335833.jpg",
                  //     category: "Books",
                  //     numOfBrands: 18,
                  //     ontap: () {},
                  //   ),
                  //   CategeriesCard(
                  //     image:
                  //         "https://www.incimages.com/uploaded_files/image/1920x1080/getty_883231284_200013331818843182490_335833.jpg",
                  //     category: "Books",
                  //     numOfBrands: 18,
                  //     ontap: () {},
                  //   ),
                  //   CategeriesCard(
                  //     image:
                  //         "https://www.incimages.com/uploaded_files/image/1920x1080/getty_883231284_200013331818843182490_335833.jpg",
                  //     category: "Books",
                  //     numOfBrands: 18,
                  //     ontap: () {},
                  //   ),
                  // ]),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: Expanded(
                  child: TextButton(
                    child: Text(
                      "Add Chategeries",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) => _myDialog,
                            fullscreenDialog: true,
                          ));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FullScreenDialog extends StatefulWidget {
  String caregory = "You have";
  String pictureUrl = "not Added";

  @override
  FullScreenDialogState createState() => new FullScreenDialogState();
}

class FullScreenDialogState extends State<FullScreenDialog> {
  TextEditingController caregoryController = new TextEditingController();
  TextEditingController urlController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add New Category"),
        ),
        body: new Padding(
            child: new ListView(
              children: <Widget>[
                new TextField(
                  controller: caregoryController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter name of the categoty"),
                ),
                SizedBox(
                  height: 20,
                ),
                new TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Url",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Save"),
                )
              ],
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30)));
  }
}
