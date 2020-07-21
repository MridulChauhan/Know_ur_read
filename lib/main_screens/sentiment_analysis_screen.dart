import 'package:flutter/material.dart';
import 'package:knowurread/custom_widgets/sign_out_button.dart';
import 'package:knowurread/services/networking.dart';

class SentimentAnalysisScreen extends StatefulWidget {
  static const String id = 'sentiment_analysis_screen';
  @override
  _SentimentAnalysisScreenState createState() =>
      _SentimentAnalysisScreenState();
}

class _SentimentAnalysisScreenState extends State<SentimentAnalysisScreen> {
  void apiData() async {
    try {
      String input = "Hey there";
      NetworkHelper networkHelper = new NetworkHelper(
          "http://192.168.43.32:5000/?Query=${input.toString()}");
      var data = await networkHelper.getData();
      print(data['Query']);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sentiment Analysis'),
        backgroundColor: Colors.redAccent,
        leading: BackButton(),
        actions: <Widget>[
          SignOutButton(),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Center(
          child: RaisedButton(onPressed: () {
            apiData();
          }),
        ),
      ),
    );
  }
}
