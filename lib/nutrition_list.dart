import 'package:daily_value_calculator/nutrient_row.dart';
import 'package:daily_value_calculator/nutrients.dart';
import 'package:flutter/material.dart';

class NutrientList extends StatefulWidget {
  const NutrientList({super.key});

  @override
  State<NutrientList> createState() => _NutrientListState();
}

class _NutrientListState extends State<NutrientList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
        child: const Row(
          children: [
            Expanded(
                child: Text(
              "Nutrient",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: Text(
              "Percentage",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: Text(
              "Serving",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: Text(
              "Daily Value",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
      Expanded(
          child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: nutrients.length,
        itemBuilder: (BuildContext context, int index) {
          return NutrientRow(nutrient: nutrients[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ))
    ]);
  }
}
