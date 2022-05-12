


import 'package:fbapi/dummydata/dummy_data.dart';
import 'package:fbapi/models/meal.dart';
import 'package:fbapi/screes/category_meals_screen.dart';
import 'package:fbapi/screes/filter_screen.dart';
import 'package:fbapi/screes/meal_detail_screen.dart';
import 'package:fbapi/screes/tabs_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 static Map<String,bool> _filters=
  {
    "gluten" : false,
    "lactose" : false,
    "vegan" : false,
    "vegetarian" : false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [ ];

void _setFilters ( Map<String,bool> _filtersData){
  setState(() {
    _filters =_filtersData;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if(_filters["gluten"]==true && meal.isGlutenFree==false) {
        return false;
      };
        if(_filters["lactose"]==true && meal.isLactoseFree==false) {
          return false;
        };
          if(_filters["vegan"]==true && meal.isVegan==false) {
            return false;
          };
            if(_filters["vegetarian"]==true && meal.isVegetarian == false) {
              return false;
      }
            return true;
    }).toList();
  });
}

void _toggleFav(String mealId){
 final existing = _favMeals.indexWhere((meal) => meal.id == mealId);/// تتحقق من وجود شرط لو مش موجودد بتديني سالب 1

 if(existing >=0 ){
   setState(() {
     _favMeals.removeAt(existing);
   });
 }else{
   setState(() {
     _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
   });
 }

}

bool _isMealFav (String id){
 return  _favMeals.any((meal) => meal.id == id);


}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromARGB(255, 254, 220, 220),
        textTheme: ThemeData.light().textTheme.copyWith(),
      ),
      debugShowCheckedModeBanner: false,
      home:TabScreen(_favMeals),
      routes: {
        // "/": (context)=> CategoryScreen(),
        CategoryMealsScreen.routName: (context) =>CategoryMealsScreen(_availableMeals),
        MealDetails.routName :(context) =>MealDetails(_toggleFav,_isMealFav),
        FilterScreen.routName: (context) =>FilterScreen(_setFilters,_filters),
        TabScreen.routName: (context) => TabScreen(_favMeals),
      },
    );
  }
}





