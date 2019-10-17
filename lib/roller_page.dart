import 'package:flutter/material.dart';
import './roller.dart';
import './rollers_provider.dart';

class RollerPage extends StatelessWidget {
  _showRollDialog (BuildContext context, Roller roller) {
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

  _buildRollerList(BuildContext context, List<Roller> rollers) {
    final Iterable<ListTile> tiles = rollers.map(
      (Roller roller) {
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
    final rollersBloc = RollersProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Generator')
      ),
      body: StreamBuilder<List<Roller>>(
        stream: rollersBloc.rollers,
        initialData: [],
        builder: (context, snapshot) {
          return _buildRollerList(context, snapshot.data);
        }
      ),
    );
  }
}
