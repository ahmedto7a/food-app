import 'package:fbapi/dummydata/dummy_data.dart';
import 'package:flutter/material.dart';
class MealDetails extends StatelessWidget {
 static const routName ="meal_detail";
 final Function toggleFav ;
 final Function isfav ;
 MealDetails(this.toggleFav,this.isfav);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final seslectmeal = DUMMY_MEALS.firstWhere((meal) =>meal.id== mealId);
    return Scaffold(
      appBar: AppBar(title: Text(seslectmeal.title),),
      body: SingleChildScrollView(
         child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(seslectmeal.imageUrl,fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(ListView.builder(
                itemBuilder: (context,index)=>Card(
                   margin: EdgeInsets.all(6),
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
                    child: Text(seslectmeal.ingredients[index],style: TextStyle(fontSize: 15),),
                  ),
                ),
                itemCount: seslectmeal.ingredients.length,

            ),),
            buildSectionTitle(context, "Steps"),
            buildContainer(
                ListView.builder(
                    itemBuilder: (context,index)=>Column(
                      children: [
                        ListTile(
                        leading: CircleAvatar(
                          child: Text("^${index+1}^"),
                        ),
                       title: Text(seslectmeal.steps[index]),
                      ),
                        Divider(color: Colors.black,),
                      ],
                    ),
                    itemCount: seslectmeal.steps.length,
                ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[300],
        child: Icon(
          isfav(mealId) ? Icons.favorite : Icons.add,
        ),
        onPressed: ()=>toggleFav(mealId),
      ),
    );
  }
}
Widget buildSectionTitle(BuildContext context ,String title){
  return Container(

    child: Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
  );
}

Widget buildContainer(Widget child){
  return Container(

    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color:Colors.grey),
    ),
    margin: EdgeInsets.all(10),
    width: 300,
    height: 150,
    child: child,
  );
}