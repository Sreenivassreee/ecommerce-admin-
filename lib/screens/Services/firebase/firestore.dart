import 'package:cloud_firestore/cloud_firestore.dart';

class Fire {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> readCategory() async {
    print("================================================");
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
          var a = {'name': doc.id, 'url': doc['url']??"Empty"};
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
}
