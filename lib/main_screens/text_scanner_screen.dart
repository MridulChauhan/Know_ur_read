import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/custom_widgets/sign_out_button.dart';
import 'package:knowurread/other_files/is_first_launch.dart';
import 'package:knowurread/other_files/text_scanner.dart';
import 'package:showcaseview/showcaseview.dart';

class TextScannerScreen extends StatefulWidget {
  static const String id = 'text_scanner_screen';
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING_TextScannerScreen";

  @override
  _TextScannerScreenState createState() => _TextScannerScreenState();
}

class _TextScannerScreenState extends State<TextScannerScreen> {
  var pickedImage;
  String scannedText;
  var key = new GlobalKey<ScaffoldState>();
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();
  GlobalKey _five = GlobalKey();
  GlobalKey _six = GlobalKey();
  GlobalKey _seven = GlobalKey();

  BuildContext myContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      IsFirstLaunch().isFirstLaunch(TextScannerScreen).then((result) {
        if (result)
          ShowCaseWidget.of(myContext)
              .startShowCase([_one, _two, _three, _four, _five, _six, _seven]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
          return Scaffold(
            key: key,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Text Scanner'),
              backgroundColor: Colors.redAccent,
              leading: Showcase(
                  title: 'Back button',
                  description: 'Press to go back to features page',
                  key: _one,
                  showcaseBackgroundColor: Colors.yellowAccent,
                  child: BackButton()),
              actions: <Widget>[
                Showcase(
                    title: 'Sign out',
                    description: 'Press to sign out',
                    key: _two,
                    showcaseBackgroundColor: Colors.yellowAccent,
                    child: SignOutButton()),
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
                                  image: FileImage(pickedImage),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Showcase(
                        title: 'Gallery',
                        description: 'Press to select an image from gallery',
                        key: _three,
                        showcaseBackgroundColor: Colors.yellowAccent,
                        child: RaisedButton(
                          child: Text('Pick an image'),
                          onPressed: () async {
                            var temp = await TextScanner()
                                .pickImage(ImageSource.gallery);
                            setState(() {
                              pickedImage = temp;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Showcase(
                        title: 'Camera',
                        description: 'Press to use camera to take a picture',
                        key: _four,
                        showcaseBackgroundColor: Colors.yellowAccent,
                        child: RaisedButton(
                          child: Text('Take an image'),
                          onPressed: () async {
                            var temp = await TextScanner()
                                .pickImage(ImageSource.camera);
                            setState(() {
                              pickedImage = temp;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Showcase(
                    title: 'Scan button',
                    description: 'Press to scan an image after importing ',
                    key: _five,
                    showcaseBackgroundColor: Colors.yellowAccent,
                    child: RoundedButton(
                        text: 'Read Text',
                        colour: Colors.lightGreen,
                        onPress: () async {
                          var temp = await TextScanner().readText(pickedImage);
                          setState(() {
                            scannedText = temp;
                          });
                        }),
                  ),
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
                              return Showcase(
                                key: _six,
                                title: 'Scanned text container',
                                description:
                                    'The scanned text from image appears \n here once you perform read text',
                                showcaseBackgroundColor: Colors.yellowAccent,
                                child: ListTile(
                                  title: IconButton(
                                    icon: Showcase(
                                      key: _seven,
                                      title: 'Copy to clipboard',
                                      description:
                                          'Press to copy the scanned content after \n you perform read text on an image',
                                      showcaseBackgroundColor:
                                          Colors.yellowAccent,
                                      child: Icon(FontAwesomeIcons
                                          .solidArrowAltCircleUp),
                                    ),
                                    iconSize: 30,
                                    onPressed: () {
                                      Clipboard.setData(new ClipboardData(
                                          text: scannedText != null
                                              ? scannedText
                                              : ''));
                                      key.currentState
                                          .showSnackBar(new SnackBar(
                                        content:
                                            new Text("Copied to Clipboard"),
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
        },
      ),
    );
  }
}
