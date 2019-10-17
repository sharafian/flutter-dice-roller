import 'package:flutter/material.dart';
import './rollers_provider.dart';
import './roller.dart';

class AddRollerForm extends StatefulWidget {
  @override
  AddRollerFormState createState() => AddRollerFormState();
}

class AddRollerFormState extends State<AddRollerForm> {
  final _formKey = GlobalKey<FormState>();

  List<Widget> _formFields(BuildContext context) {
    final rollersBloc = RollersProvider.of(context);

    return [
      TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please provide a value';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Roller name',
          hintText: 'Roller name. Any name will do',
        ),
      ),

      TextFormField(
        initialValue: '20',
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please provide a value';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Sides',
          hintText: 'How many sides does the die have?',
        ),
      ),

      TextFormField(
        initialValue: '1',
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please provide a value';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Count',
          hintText: 'How many dice should be rolled?',
        ),
      ),

      TextFormField(
        initialValue: '0',
        keyboardType: TextInputType.numberWithOptions(
          signed: true,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please provide a value';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Bonus',
          hintText: 'What bonus should be added/subtracted from the roll?',
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          child: Text('Submit'),
          onPressed: () {
            if (!_formKey.currentState.validate()) {
              return;
            }

            rollersBloc.addition.add(Roller(
              count: 1,
              sides: 2,
              bonus: 3,
            ));

            // We're done with this form
            Navigator.of(context).pop();
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _formFields(context),
      ),
    );
  }
}

class AddRollerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('hello world'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddRollerForm(),
      ),
    );
  }
}
