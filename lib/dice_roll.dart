import 'dart:math';

class DiceRollResult {
  final List<int> rolls;
  final int sum;
  final int bonus;

  const DiceRollResult({
    this.rolls,
    this.sum,
    this.bonus,
  });
}

class DiceRollSpec {
  final int count;
  final int sides;
  final int bonus;
  final random = Random();

  const DiceRollSpec({
    this.count,
    this.sides,
    this.bonus,
  });

  DiceRollResult roll() {
    var sum = bonus;
    var rolls = List<int>();

    for(var i = 0; i < count; ++i) {
      final roll = random.nextInt(sides);
      rolls.add(roll);
      sum += roll;
    }

    return DiceRollResult(
      sum: sum,
      rolls: rolls,
      bonus: bonus,
    );
  }
}
