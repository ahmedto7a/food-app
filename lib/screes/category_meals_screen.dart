import 'package:fbapi/dummydata/dummy_data.dart';
import 'package:fbapi/models/meal.dart';
import 'package:fbapi/widget/meal_item.dart';
import 'package:flutter/material.dart';


class CategoryMealsScreen extends StatefulWidget {
static const routName ="category_meals";

final List<Meal> availabaleMeals;
CategoryMealsScreen (this.availabaleMeals);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {

    var routAg = ModalRoute.of(context)!.settings.arguments  as Map<String,dynamic> ;
    final categoryId= routAg["id"];
    final categoryTitle = routAg["title"];
    final categorymeal = widget.availabaleMeals.where((meal)
    {
     return meal.categories.contains(categoryId);

    }

    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:ListView.builder(
        itemBuilder: (context,index){
          return Container(
            child: MealItem(
              id: categorymeal[index].id,
              imageUrl:categorymeal[index].imageUrl,
              title: categorymeal[index].title,
              duration: categorymeal[index].duration,
              complexity: categorymeal[index].complexity,
              affordability: categorymeal[index].affordability,
            ),
          );},

      itemCount: categorymeal.length,
      ),
    );
  }
}



