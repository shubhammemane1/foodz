import 'package:flutter/material.dart';
import 'package:foodz/model/meal.dart';
import 'package:foodz/widgets/meal_Item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            title: favouriteMeal[index].title,
            imageUrl: favouriteMeal[index].imageUrl,
            duration: favouriteMeal[index].duration,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
