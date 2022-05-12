

import 'package:fbapi/screes/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CtegoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;


  CtegoryItem(
     this.id,
     this.title,
     this.color,
  );

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routName,
  arguments: {
    "id":id,
    "title":title,
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
    selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
