import 'package:firebase_miner/Widgets/chat_User_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Api/Apis.dart';
import '../Modal/Chat_User.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomePage extends StatelessWidget {
   List<ChatUser> list=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        actions: [

          IconButton(onPressed: (){}, icon:Icon(Icons.search)),
          IconButton(onPressed: (){}, icon:Icon(Icons.more_vert)),
        ],
        title: Text('Flutter Chat App'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: (){
            Apis.auth.signOut();
            GoogleSignIn().signOut();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
      body: StreamBuilder(
        stream: Apis.firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
            case ConnectionState.none:
            return const Center(
          child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
          }

          if(snapshot.hasData){
            final data = snapshot.data?.docs;
           list= data?.map((e) => ChatUser.fromJson(e.data())).toList()??[];

          }
       if(list.isNotEmpty){
         return ListView.builder(
             padding: EdgeInsets.only(top: mq.height*0.02),
             physics: BouncingScrollPhysics(),
             itemCount: 10,
             itemBuilder: (context,index){
               return ChatUserCard(
                 user: list[index],
               );
             }
         );
       }
       else{
         return Center(child: Text('No Connection Found!',style: TextStyle(fontSize: 20),));

       }
        },
      ),
    );
  }
}
