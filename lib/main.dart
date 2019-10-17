import 'package:flutter/material.dart';
import './roller_page.dart';
import './rollers_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RollersProvider(
      child: MaterialApp(
        title: 'Name Generator',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: RollerPage(),
      ),
    );
  }
}
