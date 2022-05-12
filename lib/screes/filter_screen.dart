import 'package:fbapi/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routName = "/filters";

  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"]?? false;
    _lactoseFree = widget.currentFilters["lactose"]?? false;
    _vegetarian = widget.currentFilters["vegetarian"]?? false;
    _vegan = widget.currentFilters["vegan "]?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters",),actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final Map<String,bool> selectedFilters ={
                "gluten" : _glutenFree,
                "lactose" : _lactoseFree,
                "vegetarian" : _vegetarian,
                "vegan" : _vegan,

              };
               widget.saveFilters(selectedFilters); ///this Function == _setFilter in FilterScreen()
            },
          ),
      ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    "GlutenFree", "Only incloud gluten-free meals.", _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree= newValue ;

                  });
                }),
                buildSwitchListTile(
                    "LactoseFree", "Only include lactose-free meals.", _lactoseFree,
                        (newValue) {
                      setState(() {
                        _lactoseFree= newValue ;
                      });
                    }),
                buildSwitchListTile(
                    "Vegetarian", "Only incloud vengetarian meals", _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian=newValue ;
                      });
                    }),
                buildSwitchListTile(
                    "Vegan", "Only incloud vegan meals", _vegan,
                        (newValue) {
                      setState(() {
                        _vegan =newValue ;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

Widget buildSwitchListTile(
    String title, String description, bool currentvalue, updatvalue) {
  return SwitchListTile(
    value: currentvalue,
    title: Text(title,style: TextStyle(fontSize: 17),),
    subtitle: Text(description),
    onChanged: updatvalue,
  );
}
