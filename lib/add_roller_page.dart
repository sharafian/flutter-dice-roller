import 'package:flutter/material.dart';
import './rollers_provider.dart';
import './roller.dart';

class AddRollerForm extends StatefulWidget {
  @override
  AddRollerFormState createState() => AddRollerFormState();
}

class AddRollerFormState extends State<AddRollerForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormFieldState>();
  final _sidesKey = GlobalKey<FormFieldState>();
  final _countKey = GlobalKey<FormFieldState>();
  final _bonusKey = GlobalKey<FormFieldState>();

  List<Widget> _formFields(BuildContext context) {
    return [
      TextFormField(
        key: _nameKey,
        validator: (value) {
          if (value.isEmpty) return 'Please provide a value';
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Roller name',
          hintText: 'Roller name. Any name will do',
        ),
      ),

      TextFormField(
        key: _sidesKey,
        initialValue: '20',
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
        ),
        validator: (value) {
          if (value.isEmpty) return 'Please provide a value';
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Sides',
          hintText: 'How many sides does the die have?',
        ),
      ),

      TextFormField(
        key: _countKey,
        initialValue: '1',
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
        ),
        validator: (value) {
          if (value.isEmpty) return 'Please provide a value';
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Count',
          hintText: 'How many dice should be rolled?',
        ),
      ),

      TextFormField(
        key: _bonusKey,
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
            return _submitForm(context);
          },
        ),
      ),
    ];
  }

  void _submitForm(context) {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final rollersBloc = RollersProvider.of(context);
    rollersBloc.addition.add(Roller(
      name: _nameKey.currentState.value,
      count: int.parse(_countKey.currentState.value),
      sides: int.parse(_sidesKey.currentState.value),
      bonus: int.parse(_bonusKey.currentState.value),
    ));

    // We're done with this form
    Navigator.of(context).pop();
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
