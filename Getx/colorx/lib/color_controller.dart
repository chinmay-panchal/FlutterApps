import 'package:get/get.dart';

class ColorController extends GetxController {
  RxDouble opacity = 0.4.obs;

  void changeOpacity(double curr) {
    opacity.value = curr;
  }
}
