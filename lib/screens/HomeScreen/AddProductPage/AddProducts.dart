import 'dart:io';

import 'package:admin_for_e_commerce/GetX/GetX_add_category.dart';
import 'package:admin_for_e_commerce/screens/HomeScreen/AddProductPage/componets/AddEachProductPage.dart';
import 'package:admin_for_e_commerce/screens/Services/firebase/firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'dart:io' as io;

class Add_products extends StatefulWidget {
  @override
  _Add_productsState createState() => _Add_productsState();
}

class _Add_productsState extends State<Add_products> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AddCataController? c = AddCataController();
  Future? myFuture;
  void navigate(context, categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEachProductsPage(
          categetyName: categoryName,
        ),
      ),
    );
  }

  FullScreenDialog _myDialog = new FullScreenDialog();

  Fire f = Fire();
  List dataList = [];
  @override
  void initState() {
    super.initState();
    c?.getData();
  }

  // getData() {
  //   f.readCategory().then((value) => setState(() {
  //         dataList = value;
  //       }));
  // }

  @override
  Widget build(BuildContext context) {
    print("Read Called");
    print(c?.data);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              child: Expanded(
                  child: Obx(() => ListView.builder(
                      itemCount: c?.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategeriesCard(
                          image: c?.data[index]['url'] ?? " ",
                          category: c?.data[index]['name'],
                          numOfBrands: 18,
                          ontap: () {
                            navigate(context, c?.data[index]['name']);
                          },
                        );
                      }))

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

  Fire f = Fire();
  PickedFile? _imageFile;
  String? url;
  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<firebase_storage.UploadTask> uploadFile(file) async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No file was selected'),
      ));
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child('Allcategorys');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }
    var u = await (await uploadTask).ref.getDownloadURL();
    print("url");

    setState(() {
      url = u;
    });
    print(url);

    return Future.value(uploadTask);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add New Category"),
        ),
        body: new Padding(
            child: new ListView(
              children: <Widget>[
               InkWell(
                onTap: () {
                  _onImageButtonPressed(ImageSource.gallery, context: context);
                  // chooseFile();
                },
                child: Container(
                    height: 200,
                    width: 200,
                    child: _imageFile == null
                        ? Center(child: Icon(Icons.image))
                        : url == null
                            ? Image.file(File(_imageFile!.path))
                            : Icon(
                                Icons.check,
                                color: Colors.green,
                              ),),
              ),
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
                    if (_imageFile == null) {
                    print("select Images");
                  } else {
                    uploadFile(_imageFile)
                        .whenComplete(() => {
                              f.uploadCategories(name: caregoryController.text,url: url).whenComplete(() => {Navigator.pop(context)})
                  });
                  
                  }

        
                    
                  },
                  child: Text("Save"),
                )
              ],
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30)));
  }
}
