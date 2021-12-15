import 'package:flutter/material.dart';
import 'package:meal_app/widgets/page/filters_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondary,
              alignment: Alignment.center,
              child: Text(
                "Приготовим вместе!",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const Divider(
              color: Colors.transparent,
              height: 20,
            ),
            buildListTile("Блюда", Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed("/");
            }),
            buildListTile("Настройки", Icons.settings, () {
              Navigator.of(context).pushReplacementNamed(FiltersPage.route);
            })
          ],
        ),
      ),
    );
  }
}
