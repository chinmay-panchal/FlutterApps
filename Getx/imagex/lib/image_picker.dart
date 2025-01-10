import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString path = ''.obs;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker(); // ImagePicker is an inbuilt class
    final image = await _picker.pickImage(source: ImageSource.camera);
    // final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      path.value = image.path.toString();
    }
  }
}
