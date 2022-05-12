
import 'package:fbapi/dummydata/dummy_data.dart';
import 'package:fbapi/widget/category_item.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map((catData) =>
        CtegoryItem(catData.id,catData.title,catData.color),
        ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
      ),
    );
  }
}
