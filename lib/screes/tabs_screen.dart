import 'package:fbapi/models/meal.dart';
import 'package:fbapi/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'fav_screen.dart';
class TabScreen extends StatefulWidget {
 static const routName ="tabs_screen";
final List<Meal> _favMeals ;
TabScreen( this._favMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

   late List<Map<String,dynamic>> _pages;

 int _selectedPageIndex=0;

 @override
  void initState() {
   _pages =[
   {
   "page" : CategoryScreen(),
   "title" : "Categories",
   },
   {
   "page" : FavScreen(widget._favMeals),
   "title" : "Your Favorits",
   }
   ];

   super.initState();
  }

 void _selectedPage(int value){
   setState(() {
     _selectedPageIndex =value;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]["title"]),),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      onTap: _selectedPage,
      currentIndex: _selectedPageIndex,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.lime,
      items: [
        BottomNavigationBarItem(
          label: "category",
          icon: Icon(Icons.category_outlined),
        ),
        BottomNavigationBarItem(
          label: "Favorits",
          icon: Icon(Icons.star_border),
        ),
      ],
    ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
    );
  }
}
