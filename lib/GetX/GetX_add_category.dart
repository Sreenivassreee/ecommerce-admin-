import 'package:admin_for_e_commerce/screens/Services/firebase/firestore.dart';
import 'package:get/get.dart';

class AddCataController extends GetxController {
  var data = [].obs;
  Fire f = Fire();

  @override
  void onInit() {
    getData();
    print("Here");
  }

  getData() {
    f.readCategory().then((value) {
      print("getting");
      data.value = value.toList();
      print(value);
    });
  }
}
