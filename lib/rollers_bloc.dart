import 'dart:async';
import 'package:rxdart/subjects.dart';
import './roller.dart';

class Rollers {
  final rollers = List<Roller>();

  add (Roller roller) {
    rollers.add(roller);
  }
}

class RollersBloc {
  // This is where the state is held
  final _rollers = Rollers();

  final _items = BehaviorSubject<List<Roller>>.seeded([]);
  final _additionController = StreamController<Roller>();

  RollersBloc() {
    // Whenever there's an addition published, we emit the new list
    _additionController.stream.listen((Roller addition) {
      _rollers.add(addition);
      _items.add(_rollers.rollers);
    });
  }

  // Widgets read updates from rollers and write updates to additions
  Sink<Roller> get addition => _additionController.sink;
  Stream<List<Roller>> get rollers => _items.stream;

  void dispose() {
    _items.close();
    _additionController.close();
  }
}
