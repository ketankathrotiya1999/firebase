

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_miner/Screen/home.dart';
import 'package:firebase_miner/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helper/Dialogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth Auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn =GoogleSignIn();
  TextEditingController PhoneControler =TextEditingController();
  @override


  _handleGoogleBtnClick(){
    Dialogs.showProgreshBar(context);
    sighWithGoogle().then((user) {
      Navigator.pop(context);
      log('User:${user?.user}');
      log('UserAdditionalInfo:$user');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen() ));
    } );
  }
  Future<UserCredential?> sighWithGoogle() async{
    try{
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if(googleSignInAccount==null)
      {
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final OAuthCredential googleAuthCreential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );
      return await  Auth.signInWithCredential(googleAuthCreential);
    }

    catch(e){
      print('Error during Google sign in: $e');
      Dialogs.ShowSnackBar(context,'Somathing went to wrong Check internet Conection!');
      return null;
    }
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: ()async{
        await    FirebaseAuth.instance.signOut();
        await    googleSignIn.signOut();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
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
        height:mq.height* 0.06,
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 223, 255, 187),
              shape: StadiumBorder(),
              elevation: 1,
              
            ),
            onPressed: ()async{
          _handleGoogleBtnClick;
          UserCredential? userCredential = await sighWithGoogle();
        },
        icon: Icon(Icons.ac_unit_rounded),
        label: RichText(text: TextSpan(
          style: TextStyle(
            color: Colors.black,fontSize: 17
          ),
          children: [
            TextSpan(
              text: 'Login With'
            ),
            TextSpan(
              text: 'Google',style: TextStyle(
              fontWeight: FontWeight.w500
            )
            )
          ]
        ))))
  ],
),

    );
  }
}
