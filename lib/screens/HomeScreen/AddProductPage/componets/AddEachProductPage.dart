import 'package:flutter/material.dart';

class AddEachProductsPage extends StatefulWidget {
  final String? categetyName;
  const AddEachProductsPage({Key? key, this.categetyName}) : super(key: key);

  @override
  _AddEachProductsPageState createState() => _AddEachProductsPageState();
}

class _AddEachProductsPageState extends State<AddEachProductsPage> {
  TextEditingController brand = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController availability = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController storageOptions = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categetyName.toString())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  child: TextField(
                    controller: brand,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Brand",
                ),
              ),),
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
                
              )),  SizedBox(
                height: 10,
              ),
              Container(
                  child: TextField(
                    controller: price,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Price",
                ),
              )),  SizedBox(
                height: 10,
              ),Container(
                  child: TextField(
                    controller: storageOptions,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Storage Options",
                ),
              )),  SizedBox(
                height: 10,
              ),Container(
                  child: TextField(
                    controller: id,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "id",
                ),
              )), SizedBox(
                height: 10,
              ), Container(
                  child: TextField(
                    controller: brand,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Brand",
                ),
              )), SizedBox(
                height: 10,
              ), Container(
                  child: TextField(
                    controller: availability,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Availability",
                ),
              )),  SizedBox(
                height: 10,
              ),
              TextButton(onPressed: (){}, 
              child: Text("Submit"),)
            ],
          ),
        ),
      ),
    );
  }
}
