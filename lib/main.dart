import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screen/SpleshScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:FirebaseOptions(
        apiKey: 'AIzaSyAPvRgbcQbbevA4VX3T4WQptuC2GxSDi2k',
        appId: '794617549567',
        messagingSenderId: '',
        projectId: 'fir-miner-8fada')
  );
  runApp(MyApp());
}
late Size mq;

class MyApp extends StatelessWidget {

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SpleshScreen(),
    );
  }
}
