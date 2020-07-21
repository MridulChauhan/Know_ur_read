import 'package:image_picker/image_picker.dart';

class PickImage {
  Future pickImage(var source) async {
    try {
      var imageFile = await ImagePicker.pickImage(source: source);
      var pickedImage = imageFile;
      return pickedImage;
    } catch (e) {
      print(e);
    }
  }
}
