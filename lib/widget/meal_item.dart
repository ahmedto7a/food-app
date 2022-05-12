import 'package:fbapi/models/meal.dart';
import 'package:fbapi/screes/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealItem extends StatelessWidget {
  static const routName = "meal_item";
  final String id;
  final String imageUrl;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealItem({
    required this.id,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.title});


  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetails.routName,
      arguments: id,

    );
  }

  String get complexityText{
    switch(complexity){
      case  Complexity.Simple:return"Simple";
      case Complexity.Hard: return "Hard";
      case Complexity.Challenging: return "Challenging";
      default: return "UnKnown";

    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable: return"Affordable";
      case Affordability.Luxurious: return"Luxurious";
      case Affordability.Pricey: return"Pricey";
      default: return "UnKnown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                    child: Image.network(imageUrl,height: 200,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    color: Colors.black38,
                    width: 220,
                    child: Text(title,style: TextStyle(fontSize: 30,color: Colors.white),
                    softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule_sharp),
                      SizedBox(width: 5,),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5,),
                      Text("$affordabilityText"),
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
}
