import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceChange extends StatefulWidget {
  const DiceChange({super.key});

  @override
  State<DiceChange> createState() {
    return _DiceChangeState();
  }
}

class _DiceChangeState extends State<DiceChange> {
  var currentDiceRoll = 2;
  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1; // 1 to 6, if we remove + 1 then 0 to 5
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/dice-$currentDiceRoll.png',
          width: 200,
        ),
        // const SizedBox(height: 20,), // alternative of adding space
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              ),
            ),
            child: const Text('Roll Dice')),
      ],
    );
  }
}
