import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/widgets/elements/short_meal.dart';

class FavoutiteMealsPage extends StatefulWidget {
  const FavoutiteMealsPage({Key? key}) : super(key: key);

  @override
  State<FavoutiteMealsPage> createState() => _FavoutiteMealsPageState();
}

class _FavoutiteMealsPageState extends State<FavoutiteMealsPage> {
  @override
  Widget build(BuildContext context) {
    if (MockData.getFavouriteMeals.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 60,
        ),
        child: Center(
          child: Text(
            "У Вас нет пока избранных блюд - время добавить новое",
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: MockData.getFavouriteMeals.length,
        itemBuilder: (context, index) => ShortMeal(
          meal: MockData.getFavouriteMeals[index],
        ),
      );
    }
  }
}
