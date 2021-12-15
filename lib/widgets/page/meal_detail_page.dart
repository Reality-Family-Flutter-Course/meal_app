import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/models/meals.dart';

class MealDetailPage extends StatefulWidget {
  static const String route = "/meal";
  const MealDetailPage({Key? key}) : super(key: key);

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  Widget buildSectionTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ингредиенты"),
            buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      meal.ingredients[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle("Этапы приготовления"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  const Divider()
                ],
              ),
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (MockData.getFavouriteMeals.contains(meal)) {
              MockData.removeToFavouriteMeals(meal);
            } else {
              MockData.addToFavouriteMeals(meal);
            }
          });
        },
        child: Icon(
          (MockData.getFavouriteMeals.contains(meal)
              ? Icons.favorite
              : Icons.favorite_border),
          color: Colors.red,
        ),
      ),
    );
  }
}
