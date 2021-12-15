import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/models/categories.dart';
import 'package:meal_app/widgets/elements/short_meal.dart';

class CategoryMealsPage extends StatefulWidget {
  const CategoryMealsPage({Key? key}) : super(key: key);

  static const String route = "/categoryMeals";

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  late Category category;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    category = routeArgs["category"];

    final meals = MockData.getMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => ShortMeal(
          meal: meals[index],
        ),
      ),
    );
  }
}
