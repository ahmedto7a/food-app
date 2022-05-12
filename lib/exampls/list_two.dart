import 'package:flutter/material.dart';



class ChatModle{
  String name;
  String messeg;
  String imageUrl;

  ChatModle({required this.imageUrl, required this.messeg,required this.name});

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}


class ListTwoScreen extends StatelessWidget {
  // const ListTwoScreen({Key? key}) : super(key: key);
  List <ChatModle> chats =[];
  ListTwoScreen(){
    var imageUrl ="https://static.straitstimes.com.sg/s3fs-public/styles/article_pictrure_780x520_/public/articles/2021/08/28/2021-08-27t152656z_298019127_rc2kma70m1q8_rtrmadp_3_soccer-england-mun-ronaldo.jpg?itok=nDev9E_N&timestamp=1630080964";
        var caht0 =
    ChatModle(imageUrl:imageUrl, messeg: "hello 00", name: "ahmed");
    var caht1 =
    ChatModle(imageUrl: imageUrl, messeg: "hello 11", name: "ahmed111");
    var caht2 =
    ChatModle(imageUrl: imageUrl, messeg: "hello 22", name: "ahmed2222");
    var caht3 =
    ChatModle(imageUrl: imageUrl, messeg: "hello 33", name: "ahmed333");
    var caht4 =
    ChatModle(imageUrl: imageUrl, messeg: "hello 44", name: "ahmed444");

    chats.add(caht0);
    chats.add(caht1);
    chats.add(caht2);
    chats.add(caht3);
    chats.add(caht4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("custm List"),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,index) => buildNItem(index),

      ),
    );
  }
  Widget buildNItem(int index){
    var chat  = chats[index];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 37.5,
            backgroundColor: Colors.blue,

            child: CircleAvatar(
              // backgroundColor: Colors.red,
              radius: 35,

              backgroundImage: NetworkImage(
                  chat.imageUrl

              ),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(chat.messeg),
            ],
          ),
        ],
      ),
    );

  }
  }

