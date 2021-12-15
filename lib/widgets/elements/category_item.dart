import 'package:flutter/material.dart';
import 'package:meal_app/models/categories.dart';
import 'package:meal_app/widgets/page/category_meals_page.dart';
import 'package:meal_app/widgets/page/category_meals_page.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: category.color,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline2,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsPage.route,
      arguments: {
        "category": category,
      },
    );
  }
}
