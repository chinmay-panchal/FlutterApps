import 'dart:ffi';

import 'package:get/get.dart';

class Switchx extends GetxController {
  RxBool val = false.obs;

  void changeSwitch(bool curr) {
    val.value = curr;
  }
}
