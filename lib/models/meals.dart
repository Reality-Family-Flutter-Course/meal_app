enum Complexity {
  simple,
  hard,
  extream,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;
  final bool isVegan;
  final List<String> categories;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.isVegan,
    required this.categories,
  });

  String get getAffordability {
    switch (affordability) {
      case Affordability.affordable:
        return "Не дорогое";
      case Affordability.pricey:
        return "Среднее";
      case Affordability.luxurious:
        return "Дорогое";
      default:
        return "";
    }
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.simple:
        return "Легкое";
      case Complexity.hard:
        return "сложное";
      case Complexity.extream:
        return "Очень сложное";
      default:
        return "";
    }
  }
}
