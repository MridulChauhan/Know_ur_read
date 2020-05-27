import 'package:flutter/material.dart';
import 'package:knowurread/custom_widgets/sign_out_button.dart';

class TextSummarizerScreen extends StatefulWidget {
  static const String id = 'text_summarizer_screen';
  @override
  _TextSummarizerScreenState createState() => _TextSummarizerScreenState();
}

class _TextSummarizerScreenState extends State<TextSummarizerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Text Summarizer'),
        backgroundColor: Colors.redAccent,
        leading: BackButton(),
        actions: <Widget>[
          SignOutButton(),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.redAccent),
      ),
    );
  }
}
