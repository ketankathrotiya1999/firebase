

import 'package:firebase_miner/Screen/home.dart';
import 'package:firebase_miner/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Api/Apis.dart';
import '../Auth/login_Screen.dart';

class SpleshScreen extends StatefulWidget {
  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed( const Duration (
      seconds: 3
    ),(){
      if(Apis.auth.currentUser != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      }
      else{Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));}

    });
  }
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [

          IconButton(onPressed: (){}, icon:Icon(Icons.search)),
          IconButton(onPressed: (){}, icon:Icon(Icons.more_vert)),
        ],
        title: Text('welcome Chat App'),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 10),
      //   child: FloatingActionButton(
      //     onPressed: (){},
      //     child: Icon(Icons.add_comment_rounded),
      //   ),
      // ),
      body: Stack(
        children: [
          Positioned(
            top:mq.height*0.15 ,
            left: mq.width*0.25,
            width: mq.width*0.5,
            child:Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjJO8__6sEEqGcBhAK28mDfbRor_YZFMxXGA&usqp=CAU'),

          ),
          Positioned(
              bottom:mq.height*0.15 ,
              left: mq.width*0.05,
              width:mq.width* 0.9,
              height:mq.height* 0.07,
              child: Text("Made in India",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16),)
          )
        ],
      ),

    );
  }
}
