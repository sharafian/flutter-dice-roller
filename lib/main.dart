import 'package:flutter/material.dart';
import './roller_page.dart';
import './rollers_provider.dart';
import './rollers_bloc.dart';

void main() => runApp(RollerApp());

class RollerAppState extends State<RollerApp> {
  RollersBloc rollersBloc;

  @override
  void initState() {
    rollersBloc = RollersBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RollersProvider(
      rollersBloc: rollersBloc,
      child: MaterialApp(
        title: 'Dice Roller',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: RollerPage(),
      ),
    );
  }
}

class RollerApp extends StatefulWidget {
  @override
  RollerAppState createState() => RollerAppState();
}
