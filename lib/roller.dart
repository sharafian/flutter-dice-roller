import 'dart:math';

class RollerResult {
  final List<int> rolls;
  final int sum;
  final int bonus;

  const RollerResult({
    this.rolls,
    this.sum,
    this.bonus,
  });
}

class Roller {
  final int count;
  final int sides;
  final int bonus;
  final String name;
  final random = Random();

  Roller({
    this.count,
    this.sides,
    this.bonus,
    this.name,
  });

  RollerResult roll() {
    var sum = bonus;
    var rolls = List<int>();

    for(var i = 0; i < count; ++i) {
      final roll = random.nextInt(sides);
      rolls.add(roll);
      sum += roll;
    }

    return RollerResult(
      sum: sum,
      rolls: rolls,
      bonus: bonus,
    );
  }
}
