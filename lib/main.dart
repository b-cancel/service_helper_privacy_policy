import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Helper Privacy Policy',
      home: PrivacyPolicy(),
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mdFileName = 'privacy_policy.md';
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Helper Privacy Policy"),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 150)).then(
          (value) {
            return rootBundle.loadString('$mdFileName');
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              physics: BouncingScrollPhysics(),
              data: snapshot.data.toString(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
