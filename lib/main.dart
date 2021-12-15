import 'package:flutter/material.dart';
import 'package:meal_app/widgets/page/category_meals_page.dart';
import 'package:meal_app/widgets/page/category_page.dart';
import 'package:meal_app/widgets/page/filters_page.dart';
import 'package:meal_app/widgets/page/meal_detail_page.dart';
import 'package:meal_app/widgets/page/tab_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          headline4: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const TabPage(),
        CategoryMealsPage.route: (context) => const CategoryMealsPage(),
        FiltersPage.route: (context) => const FiltersPage(),
        MealDetailPage.route: (context) => const MealDetailPage(),
      },
    );
  }
}
