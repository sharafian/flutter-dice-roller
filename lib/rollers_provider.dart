import 'package:flutter/widgets.dart';
import './rollers_bloc.dart';

class RollersProvider extends InheritedWidget {
  final RollersBloc rollersBloc;

  RollersProvider({
    Key key,
    RollersBloc rollersBloc,
    Widget child,
  }) : rollersBloc = rollersBloc ?? RollersBloc(),
    super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RollersBloc of(BuildContext context) =>
    (context.inheritFromWidgetOfExactType(RollersProvider)
      as RollersProvider)
      .rollersBloc;
}
