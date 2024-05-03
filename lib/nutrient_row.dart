import 'package:daily_value_calculator/nutrients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NutrientRow extends StatefulWidget {
  final Nutrient nutrient;
  const NutrientRow({super.key, required this.nutrient});

  @override
  State<NutrientRow> createState() => _NutrientRowState();
}

class _NutrientRowState extends State<NutrientRow> {
  double _calculatedServing = 0.0;

  double calculateServing(double percentConsumed) {
    return widget.nutrient.dailyValue * (percentConsumed / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: Text(
        widget.nutrient.name,
        textAlign: TextAlign.center,
      )),
      Flexible(
          child: TextField(
        onChanged: (text) {
          setState(() {
            _calculatedServing = calculateServing(double.tryParse(text) ?? 0.0);
          });
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(), suffixText: "%"),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.]?\d*)')),
        ],
        textAlign: TextAlign.center,
      )),
      Expanded(
          child: Text(
        _calculatedServing > 0
            ? '${_calculatedServing.toStringAsFixed(1)}${widget.nutrient.unit.name}'
            : '',
        textAlign: TextAlign.center,
      )),
      Expanded(
          child: Text(
        '${widget.nutrient.dailyValue}${widget.nutrient.unit.name}',
        textAlign: TextAlign.center,
      )),
    ]);
  }
}
