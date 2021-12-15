import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/page/meal_detail_page.dart';

class ShortMeal extends StatelessWidget {
  final Meal meal;
  late final BuildContext context;

  ShortMeal({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return InkWell(
      onTap: switchToMeal,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      meal.title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const VerticalDivider(
                        width: 5,
                        color: Colors.transparent,
                      ),
                      Text("${meal.duration} мин"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                      ),
                      const VerticalDivider(
                        width: 5,
                        color: Colors.transparent,
                      ),
                      Text(meal.getComplexity),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                      ),
                      const VerticalDivider(
                        width: 5,
                        color: Colors.transparent,
                      ),
                      Text(meal.getAffordability),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void switchToMeal() {
    Navigator.of(context).pushNamed(MealDetailPage.route, arguments: meal);
  }
}
