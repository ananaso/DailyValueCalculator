import 'package:daily_value_calculator/nutrients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NutritionTable extends StatefulWidget {
  const NutritionTable({super.key});

  @override
  State<NutritionTable> createState() => _NutritionTableState();
}

class _NutritionTableState extends State<NutritionTable> {
  final addedSugarDailyValue = 50;
  final String addedSugarUnit = 'g';
  double _calculatedServing = 0.0;

  double calculateServing(num dailyValue, double percentConsumed) {
    return dailyValue * (percentConsumed / 100);
  }

  double parsePercentInput(String text) {
    return double.tryParse(text) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(
          child: Text(
        'Added Sugar',
        textAlign: TextAlign.center,
      )),
      Flexible(
          child: TextField(
        onChanged: (text) {
          setState(() {
            _calculatedServing =
                calculateServing(addedSugarDailyValue, parsePercentInput(text));
          });
        },
        decoration: const InputDecoration(border: OutlineInputBorder()),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.]?\d*)')),
        ],
        textAlign: TextAlign.center,
      )),
      Expanded(
          child: Text(
        '${_calculatedServing.toStringAsFixed(1)}$addedSugarUnit',
        textAlign: TextAlign.center,
      )),
      Expanded(
          child: Text(
        '$addedSugarDailyValue$addedSugarUnit',
        textAlign: TextAlign.center,
      )),
    ]);
  }
}
