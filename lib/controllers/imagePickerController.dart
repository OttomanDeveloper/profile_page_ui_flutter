import 'dart:convert';
import 'dart:typed_data';

import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profileui/services/fetchImage.dart';
import 'package:profileui/services/uploadimage.dart';

class ImagePickerController extends GetxController {
  Rx<XFile> image = XFile('').obs;
  RxBool isPicked = false.obs;

  void getImage({required bool isCamera}) async {
    XFile? _file;

    if (isCamera) {
      _file = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      _file = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (_file != null) {
      image.value = XFile(_file.path);
      isPicked.value = true;
    }
  }

  void setProfile() async {
    String encodedImage = "";

    if (image.value.path.isNotEmpty) {
      Uint8List bytes = await image.value.readAsBytes();
      encodedImage = base64Encode(bytes);
      await uploadImage(image: encodedImage);
    } else {
      print("Image not Selected");
    }
  }

  Rx<String> dbImage = ''.obs;

  void imagefromDb() async {
    var result = await fetchImage(id: '6');
    if (result != '') {
      dbImage.value = result['image'];
      print(result['image']);
    }
  }
}
