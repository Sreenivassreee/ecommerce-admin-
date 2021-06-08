import 'dart:io' as io;
import 'dart:io';

import 'package:admin_for_e_commerce/screens/Services/firebase/firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'
    as firebase_storage; // For File Upload To Firestore

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEachProductsPage extends StatefulWidget {
  final String? categetyName;
  const AddEachProductsPage({Key? key, this.categetyName}) : super(key: key);

  @override
  _AddEachProductsPageState createState() => _AddEachProductsPageState();
}

class _AddEachProductsPageState extends State<AddEachProductsPage> {
  TextEditingController brand = TextEditingController();
  TextEditingController name = TextEditingController();

  TextEditingController color = TextEditingController();
  TextEditingController availability = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController storageOptions = TextEditingController();
  Fire f = Fire();
  PickedFile? _imageFile;
  String? url;
  final ImagePicker _picker = ImagePicker();

  // Future chooseFile() async {
  //   await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
  //     setState(() {
  //       _image = image;
  //     });
  //   });
  // }

  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

//  Future uploadFile() async {
//    firebase_storage.UploadTask uploadTask;
//    Reference storageReference = FirebaseStorage.instance.ref().child('categorys/${widget.categetyName}/${id.text.toString()}}');

//  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//         .ref()
//         .child('categorys')
//         .child('/${widget.categetyName}')
//         .child('/id.text.toString()');

// final metadata = firebase_storage.SettableMetadata(
//         contentType: 'image/jpeg',
//         customMetadata: {'picked-file-path': file.path});

//    await uploadTask.onComplete;
//    print('File Uploaded');
//    storageReference.getDownloadURL().then((fileURL) {
//      setState(() {
//        _uploadedFileURL = fileURL;
//      });
//    });
//  }

  Future<firebase_storage.UploadTask> uploadFile(file) async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No file was selected'),
      ));
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('categorys')
        .child('/${widget.categetyName}')
        .child('/${id.text.toString()}');

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
    return Scaffold(
      appBar: AppBar(title: Text(widget.categetyName.toString())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                            ),
                ),
              ),
              // TextButton(
              //     onPressed: () {
              //       uploadFile(_imageFile);
              //     },
              //     child: Text('Upload Image')),
              Container(
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: brand,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Brand",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: TextField(
                controller: model,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Model",
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: TextField(
                controller: price,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Price",
                ),
              )),
              SizedBox(
                height: 10,
              ),
              // Container(
              //     child: TextField(
              //   controller: storageOptions,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: "Storage Options",
              //   ),
              // // )),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //     child: TextField(
              //   controller: id,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: "id",
              //   ),
              // )),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //     child: TextField(
              //   controller: brand,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: "Brand",
              //   ),
              // )),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: TextField(
                controller: availability,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Availability",
                ),
              )),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  if (_imageFile == null) {
                    print("select Images");
                  } else {
                    uploadFile(_imageFile)
                        .whenComplete(() => {
                              f.uploadProducts(
                                  cata: widget.categetyName,
                                  name: name.text,
                                  brand: brand.text,
                                  model: model.text,
                                  price: price.text,
                                  availability: availability.text,
                                  url: url)
                            })
                        .whenComplete(() => {Navigator.pop(context)});
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
