import 'package:flutter/material.dart';

import 'package:login_/screens/login_screen.dart';

void main() => runApp(new MyApp());

final routes = {
  '/login_': (BuildContext context) => new LoginPage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sqflite Uygulaması',
      theme: new ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
}
