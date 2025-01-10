import 'package:get/get.dart';

class Favorite extends GetxController {
  final RxList<String> items =
      ['Tata Punch', 'Mini Cooper', 'Porsche', 'Rolls Royce'].obs;

  final favitems = [].obs;

  addToFav(String val) {
    favitems.add(val);
  }

  removeFav(String val) {
    favitems.remove(val);
  }
}
