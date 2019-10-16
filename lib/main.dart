import 'package:flutter/material.dart';
import './roller_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RollerList(),
    );
  }
}
