import 'package:cloud_firestore/cloud_firestore.dart';

class Fire {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> readCategory() async {
    QuerySnapshot querySnapshot;

    List docs = [];
    try {
      querySnapshot = await firestore
          .collection('admin')
          .doc('Product_categories')
          .collection('categories')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          print(doc['url']);
          var a = {'name': doc.id, 'url': doc['url'] ?? "Empty"};
          docs.add(a);
        }
        print(docs);
        return docs;
      } else {
        print("Nothing is there");
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> uploadProducts(
      {cata,name, brand, model, price, availability,url}) async {
    try {
      await firestore
          .collection('admin')
          .doc('Product_categories')
          .collection('categories')
          .doc("${cata}")
          .collection('${cata}')
          .add({
        'name': name.toString(),
        'brand': brand.toString(),
        'model': model.toString(),
        'price': price.toString(),
        'url': url.toString(),
        'availability':availability.toString()

      });
    } catch (e) {
      print(e);
      print("Failed to upload");
    }
  }
}
