import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/custom_widgets/sign_out_button.dart';
import 'package:knowurread/other_files/text_scanner.dart';

class TextScannerScreen extends StatefulWidget {
  static const String id = 'text_scanner_screen';

  @override
  _TextScannerScreenState createState() => _TextScannerScreenState();
}

class _TextScannerScreenState extends State<TextScannerScreen> {
  var pickedImage;
  String scannedText;
  final key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Text Scanner'),
        backgroundColor: Colors.redAccent,
        leading: BackButton(),
        actions: <Widget>[
          SignOutButton(),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            pickedImage != null
                ? Center(
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(pickedImage), fit: BoxFit.cover),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Pick an image'),
                  onPressed: () async {
                    var temp =
                        await TextScanner().pickImage(ImageSource.gallery);
                    setState(() {
                      pickedImage = temp;
                    });
                  },
                ),
                SizedBox(width: 10),
                RaisedButton(
                  child: Text('Take an image'),
                  onPressed: () async {
                    var temp =
                        await TextScanner().pickImage(ImageSource.camera);
                    setState(() {
                      pickedImage = temp;
                    });
                  },
                ),
              ],
            ),
            RoundedButton(
                text: 'Read Text',
                colour: Colors.lightGreen,
                onPress: () async {
                  var temp = await TextScanner().readText(pickedImage);
                  setState(() {
                    scannedText = temp;
                  });
                }),
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.3,
                builder: (BuildContext context, myscrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      controller: myscrollController,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: IconButton(
                            icon: Icon(FontAwesomeIcons.solidArrowAltCircleUp),
                            iconSize: 30,
                            onPressed: () {
                              Clipboard.setData(new ClipboardData(
                                  text:
                                      scannedText != null ? scannedText : ''));
                              key.currentState.showSnackBar(new SnackBar(
                                content: new Text("Copied to Clipboard"),
                              ));
                            },
                          ),
                          subtitle: Text(
                            '${scannedText != null ? scannedText : 'Please provide an input above and drag'
                                ' up. '
                                '\n\n Tap the arrow button to copy text to clipboard'}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
