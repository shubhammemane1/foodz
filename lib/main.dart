import 'package:flutter/material.dart';
import 'package:foodz/dummy_data.dart';
import 'package:foodz/model/meal.dart';
import 'package:foodz/screens/filters_screen.dart';

import 'screens/favourite_Screen.dart';
import 'screens/tab_Screen.dart';
import 'screens/category_meal_Screen.dart';
import 'screens/meal_details_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingMeal =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingMeal >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingMeal);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodz',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.grey,
          fontFamily: 'Raleway',
          textTheme: TextTheme(
              title: TextStyle(color: Colors.black),
              body2: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.bold))),
      home: TabsScreen(_favouriteMeals),
      routes: {
        '/Category-Meals': (ctx) => CategoryMealsScreen(_availableMeals),
        '/Meal-Details-Screen': (ctx) =>
            MealDetailsScreen(_toggleFavourite, _isFavourite),
        '/Favourite-Screen': (ctx) => FavouriteScreen(_favouriteMeals),
        '/Filters-Screen': (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
