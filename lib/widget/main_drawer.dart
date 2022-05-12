
import 'package:fbapi/screes/filter_screen.dart';
import 'package:fbapi/screes/tabs_screen.dart';
import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:[
          Container(

          height: 140,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(

            color: Colors.orange
          ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Cooking Up!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
            ),
        ),
          SizedBox(height: 20,),
          buildListTile("Meal", Icons.restaurant_menu,  (){Navigator.of(context).pushNamed(TabScreen.routName);}),

          buildListTile("Filters", Icons.settings, (){Navigator.of(context).pushNamed(FilterScreen.routName);}),

        ],
      ),
    );
  }
}

Widget  buildListTile ( String title, IconData icon, tapHandelr ){
  return ListTile(
    title: Text(title,style: TextStyle(fontSize: 25,fontFamily: "RobotoCondensed",fontWeight: FontWeight.bold),),

    leading: Icon(icon,size: 26,),
    onTap: tapHandelr,
  );
}

