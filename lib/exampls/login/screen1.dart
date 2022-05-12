import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen1 extends StatelessWidget {
  // const Screen1({Key? key}) : super(key: key);
var name ="gest";
var txt =TextEditingController();
void SaveData() async{
   var dp = await SharedPreferences.getInstance();
   dp.setBool("saved", true);
   dp.setString("name", "joker");
   print("data Saved");
}
void GetData() async{
var dp = await SharedPreferences.getInstance();
    dp.getBool("saved");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txt,
            ),
            // Text("welcome ${name}"),
            ElevatedButton(
              onPressed: () {SaveData();},
              child: Text("Save Data"),
            ),

          ],
        ),
      ),
    );
  }
}
