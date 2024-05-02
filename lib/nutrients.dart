final nutrients = [
  Nutrient('Added Sugar', 50, Unit.g),
  Nutrient('Biotin', 30, Unit.mcg),
  Nutrient('Calcium', 1300, Unit.mg),
  Nutrient('Chloride', 2300, Unit.mg),
  Nutrient('Choline', 550, Unit.mg),
  Nutrient('Cholesterol', 300, Unit.mg)
];

enum Unit { g, mg, mcg }

class Nutrient {
  final String name;
  final num dailyValue;
  final Unit unit;

  Nutrient(this.name, this.dailyValue, this.unit);
}
