import 'package:fbapi/models/meal.dart';
import 'package:fbapi/widget/meal_item.dart';
import 'package:flutter/material.dart';
class FavScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text("Favorits"),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context,index){
          return
             MealItem(
              id: favMeals[index].id,
              imageUrl:favMeals[index].imageUrl,
              title: favMeals[index].title,
              duration: favMeals[index].duration,
              complexity: favMeals[index].complexity,
              affordability: favMeals[index].affordability,
            );
          },

        itemCount: favMeals.length,
      );
    }
  }
}
