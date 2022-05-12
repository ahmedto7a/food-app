
import 'package:flutter/material.dart';

import 'chat_moudle.dart';

class ListOfScreen extends StatelessWidget {
  // const ListOfScreen({Key? key}) : super(key: key);
 List<ChatMoodle> chats=[];
ListOfScreen(){
  var imageUrl="https://static.straitstimes.com.sg/s3fs-public/styles/article_pictrure_780x520_/public/articles/2021/08/28/2021-08-27t152656z_298019127_rc2kma70m1q8_rtrmadp_3_soccer-england-mun-ronaldo.jpg?itok=nDev9E_N&timestamp=1630080964";
  var chat0=
      ChatMoodle(image: imageUrl, name: "Ahmed", title:"b77777bbbb7777" );
  var chat1=
  ChatMoodle(image: imageUrl, name: "Ahmed5555", title:"b77777bbbb7777kkk" );
  var chat2=
  ChatMoodle(image: imageUrl, name: "Ahmed66666", title:"b77777bbbb7777wwwww" );
  var chat3=
  ChatMoodle(image: imageUrl, name: "Ahmed77777", title:"b77777bbbb7777rrrrr" );
  var chat4=
  ChatMoodle(image: imageUrl, name: "Ahmed88888", title:"b77777bbbb7777jjjjj" );

  chats.add(chat0);
  chats.add(chat1);
  chats.add(chat2);
  chats.add(chat3);
  chats.add(chat4);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
          itemBuilder: (context,index) => buldedItem(index)
    ),
    );
  }
 Widget buldedItem(int index){
   var chatt = chats[index];
   return Container(
     padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
     child: Row(
       children: [
         CircleAvatar(
           radius: 37.6,
           backgroundColor: Colors.blue,
           child: CircleAvatar(
             radius: 35,
             backgroundImage: NetworkImage(chatt.image),
           ),
         ),
         SizedBox(width: 10,),
         Column(
           children: [
             Text(chatt.name,style: TextStyle(fontWeight: FontWeight.bold),),
             Text(chatt.title),
           ],
         ),
       ],
     ),
   );
 }
}


