import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _showSms() {
    _launcher("sms:Erdem Furkan Kilic");
  }

  void _showTelephone() {
    _launcher("tel:05071353822");
  }

  void _launcher(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'url bulanamadı';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("DENEME"),
            ),
            body: Container(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new RaisedButton(
                      onPressed: () {
                        _showSms();
                      },
                      child: new Text("SMS"),
                    ),
                    new RaisedButton(
                      onPressed: () {
                        _showTelephone();
                      },
                      child: new Text("Telefon"),
                    )
                  ],
                ),
              ),
              color: Colors.blueAccent,
            )));
  }

// _callConnect(String p) async {
//   String tel = "tel:05071353822";
//   if (await canLaunch(tel)) {
//     await launch(tel);
//   }
}
