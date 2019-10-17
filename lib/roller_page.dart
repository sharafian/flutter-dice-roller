import 'package:flutter/material.dart';
import './roller.dart';
import './rollers_provider.dart';
import './add_roller_page.dart';

class RollerPage extends StatelessWidget {
  _showRollDialog (BuildContext context, Roller roller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final result = roller.roll();
        return new AlertDialog(
          title: new Text("${roller.name} ${result.sum}"),
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
          title: Text("${roller.name}, ${roller.count}d${roller.sides} + ${roller.bonus}"),
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
        title: Text('Dice Roller')
      ),
      body: StreamBuilder<List<Roller>>(
        stream: rollersBloc.rollers,
        initialData: [],
        builder: (context, snapshot) {
          return _buildRollerList(context, snapshot.data);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (_) {
              return AddRollerPage();
            },
          ));
        },
      ),
    );
  }
}
