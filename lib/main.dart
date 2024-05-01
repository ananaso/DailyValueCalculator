import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const DailyValueCalculator());
}

class DailyValueCalculator extends StatelessWidget {
  const DailyValueCalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Value Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HomePage(title: 'Daily Value Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const NutritionTable());
  }
}

class NutritionTable extends StatefulWidget {
  const NutritionTable({super.key});

  @override
  State<NutritionTable> createState() => _NutritionTableState();
}

class _NutritionTableState extends State<NutritionTable> {
  final addedSugarDailyValue = 50;
  num _calculatedServing = 0.0;

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
          Text('Nutrient'),
          Text('Percentage'),
          Text('Serving'),
          Text('Daily Total'),
        ]),
        TableRow(children: <Widget>[
          const Text('Added Sugars'),
          TableCell(
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _calculatedServing = addedSugarDailyValue *
                      ((double.tryParse(text) ?? 0.0) / 100);
                });
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'(^\d*[\.]?\d*)')),
              ],
            ),
          ),
          TableCell(
            child: Text(
              _calculatedServing.toStringAsFixed(1),
            ),
          ),
          const Text('50g'),
        ])
      ],
    );
  }
}
