import 'package:flutter/material.dart';
import 'package:foodz/model/meal.dart';

import '../screens/main_Drawer.dart';
import '../screens/favourite_Screen.dart';
import '../screens/category_Screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  TabsScreen(this.favouriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        "Page": CategoryScreen(),
        "Title": "Category",
      },
      {
        "Page": FavouriteScreen(widget.favouriteMeal),
        "Title": "Your Favourite",
      }
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['Title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        onTap: _selectedPage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[500],
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          )
        ],
      ),
    );
  }
}
