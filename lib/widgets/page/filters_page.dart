import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/widgets/page/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const String route = "/filters";
  const FiltersPage({Key? key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Настройки",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Выберите Ваши предпочтения в еде",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Без глютеновые блюда",
                  "При выборе данного пункта все блюда включающие в свой состав глютен не будут отображаться",
                  MockData.isGlutenFree,
                  (value) {
                    setState(
                      () {
                        MockData.isGlutenFree = value;
                      },
                    );
                  },
                ),
                const Divider(),
                _buildSwitchListTile(
                  "Без лактозные блюда",
                  "При выборе данного пункта все блюда включающие в свой состав лактозу не будут отображаться",
                  MockData.isLactoseFree,
                  (value) {
                    setState(
                      () {
                        MockData.isLactoseFree = value;
                      },
                    );
                  },
                ),
                const Divider(),
                _buildSwitchListTile(
                  "Вегетарианские блюда",
                  "При выборе данного пункта все блюда включающие в свой состав мясные продукты не будут отображаться",
                  MockData.isVegetarian,
                  (value) {
                    setState(
                      () {
                        MockData.isVegetarian = value;
                      },
                    );
                  },
                ),
                const Divider(),
                _buildSwitchListTile(
                  "Веганские блюда",
                  "При выборе данного пункта все блюда включающие в свой состав продукты животного происхождения не будут отображаться",
                  MockData.isVegan,
                  (value) {
                    setState(
                      () {
                        MockData.isVegan = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildSwitchListTile(
    String title,
    String description,
    bool parameter,
    void Function(bool) tapHandler,
  ) {
    return SwitchListTile(
      value: parameter,
      onChanged: tapHandler,
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
