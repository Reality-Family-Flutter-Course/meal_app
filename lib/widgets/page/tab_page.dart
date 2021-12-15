import 'package:flutter/material.dart';
import 'package:meal_app/widgets/page/category_page.dart';
import 'package:meal_app/widgets/page/favourite_meals_page.dart';
import 'package:meal_app/widgets/page/main_drawer.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedPageIndex = 0;
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoryPage(),
        'title': "Категории",
      },
      {
        'page': const FavoutiteMealsPage(),
        'title': "Избранное",
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelected,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Категории",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Избранное",
          ),
        ],
      ),
    );
  }

  void _onSelected(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }
}
