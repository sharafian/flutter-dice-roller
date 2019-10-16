import 'package:flutter/material.dart';
import './dice_roll.dart';

class RollerList extends StatelessWidget {
  final _rollers = [
    DiceRollSpec(count: 1, sides: 20, bonus: 0),
    DiceRollSpec(count: 1, sides: 20, bonus: 5),
    DiceRollSpec(count: 1, sides: 100, bonus: 0),
    DiceRollSpec(count: 6, sides: 6, bonus: 18),
  ];

  _showRollDialog (BuildContext context, DiceRollSpec roller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final result = roller.roll();
        return new AlertDialog(
          title: new Text(result.sum.toString()),
          content: new Text("${result.rolls.join(' + ')}, bonus ${result.bonus}"),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _buildRollerList(BuildContext context) {
    final Iterable<ListTile> tiles = _rollers.map(
      (DiceRollSpec roller) {
        return ListTile(
          title: Text("${roller.count}d${roller.sides} + ${roller.bonus}"),
          trailing: Text('Roll'),
          onTap: () => _showRollDialog(context, roller),
        );
      }
    );

    return ListView(
      children: ListTile
        .divideTiles(
          context: context,
          tiles: tiles,
        )
        .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Generator')
      ),
      body: _buildRollerList(context),
    );
  }
}
