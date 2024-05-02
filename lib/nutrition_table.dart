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
    return Table(
      // border: TableBorder.all(),
      // columnWidths: const <int, TableColumnWidth>{
      //   0: FlexColumnWidth(),
      //   1: FlexColumnWidth()
      // },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        const TableRow(children: <Widget>[
          Text(
            'Nutrient',
            textAlign: TextAlign.center,
          ),
          Text(
            'Percentage',
            textAlign: TextAlign.center,
          ),
          Text(
            'Serving',
            textAlign: TextAlign.center,
          ),
          Text(
            'Daily Total',
            textAlign: TextAlign.center,
          ),
        ]),
        TableRow(children: <Widget>[
          const Text(
            'Added Sugars',
            textAlign: TextAlign.center,
          ),
          TableCell(
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _calculatedServing = calculateServing(
                      addedSugarDailyValue, parsePercentInput(text));
                });
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.]?\d*)')),
              ],
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              '${_calculatedServing.toStringAsFixed(1)}$addedSugarUnit',
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            '50g',
            textAlign: TextAlign.center,
          ),
        ])
      ],
    );
  }
}
