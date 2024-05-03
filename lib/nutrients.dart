final nutrients = [
  Nutrient('Added Sugar', 50, Unit.g),
  Nutrient('Biotin', 30, Unit.mcg),
  Nutrient('Calcium', 1300, Unit.mg),
  Nutrient('Chloride', 2300, Unit.mg),
  Nutrient('Choline', 550, Unit.mg),
  Nutrient('Cholesterol', 300, Unit.mg),
  Nutrient('Chromium', 35, Unit.mcg),
  Nutrient('Copper', 0.9, Unit.mg),
  Nutrient('Dietary Fiber', 28, Unit.g),
  Nutrient('Fat', 78, Unit.g),
  Nutrient('Folate/Folic Acid', 400, Unit.mcg),
  Nutrient('Iodine', 150, Unit.mcg),
  Nutrient('Iron', 18, Unit.mg),
  Nutrient('Magnesium', 420, Unit.mg),
  Nutrient('Manganese', 2.3, Unit.mg),
  Nutrient('Molybdenum', 45, Unit.mcg),
  Nutrient('Niacin', 16, Unit.mg),
  Nutrient('Pantothenic Acid', 5, Unit.mg),
  Nutrient('Phosphorus', 1250, Unit.mg),
  Nutrient('Potassium', 4700, Unit.mg),
  Nutrient('Protein', 50, Unit.g),
  Nutrient('Riboflavin', 1.3, Unit.mg),
  Nutrient('Saturated Fat', 20, Unit.g),
  Nutrient('Selenium', 55, Unit.mcg),
  Nutrient('Sodium', 2300, Unit.mg),
  Nutrient('Thiamin', 1.2, Unit.mg),
  Nutrient('Total Carbohydrate', 275, Unit.g),
  Nutrient('Vitamin A', 900, Unit.mcg),
  Nutrient('Vitamin B6', 1.7, Unit.mg),
  Nutrient('Vitamin B12', 2.4, Unit.mcg),
  Nutrient('Vitamin C', 90, Unit.mg),
  Nutrient('Vitamin D', 20, Unit.mcg),
  Nutrient('Vitamin E', 15, Unit.mg),
  Nutrient('Vitamin K', 120, Unit.mcg),
  Nutrient('Zinc', 11, Unit.mg),
];

enum Unit { g, mg, mcg }

class Nutrient {
  final String name;
  final num dailyValue;
  final Unit unit;

  Nutrient(this.name, this.dailyValue, this.unit);
}
