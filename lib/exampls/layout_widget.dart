import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Center(
         child: Container(

           child: Padding(
             padding: const EdgeInsets.only(top: 100,right: 60,left: 60,bottom: 100),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("hello name",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("hello mouther fother"),
                      ],
                    ),
                  ),
                  Icon(Icons.star,color: Colors.red,),
                  Text("4"),
                ],
              ),
           ),
         ),
       ),
    );
  }
}
