import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

class TextScanner {
  Future pickImage(var source) async {
    try {
      var imageFile = await ImagePicker.pickImage(source: source);
      var pickedImage = imageFile;
      return pickedImage;
    } catch (e) {
      print(e);
    }
  }

  Future readText(pickedImage) async {
    try {
      final FirebaseVisionImage ourImage =
          FirebaseVisionImage.fromFile(pickedImage);
      final TextRecognizer recognizeText =
          FirebaseVision.instance.textRecognizer();
      final VisionText visionText = await recognizeText.processImage(ourImage);
      String text = "";
      for (TextBlock block in visionText.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            text += (element.text + " ");
          }
          text = text + "\n";
        }
        text = text + "\n\n";
      }
      recognizeText.close();
      return text;
    } catch (e) {
      print(e);
    }
  }
}
