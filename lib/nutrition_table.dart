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
      const Row(
        children: [
          Expanded(
              child: Text(
            "Nutrient",
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            "Percentage",
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            "Serving",
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Text(
            "Daily Value",
            textAlign: TextAlign.center,
          ))
        ],
      ),
      Expanded(
          child: ListView.separated(
        itemCount: nutrients.length,
        itemBuilder: (BuildContext context, int index) {
          return NutrientRow(nutrient: nutrients[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ))
    ]);
  }
}
