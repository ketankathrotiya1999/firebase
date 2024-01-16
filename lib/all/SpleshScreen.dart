// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'OtpScreen.dart';
//
// class SpleshScreen extends StatefulWidget {
//   const SpleshScreen({super.key});
//
//   @override
//   State<SpleshScreen> createState() => _SpleshScreenState();
// }
//
// class _SpleshScreenState extends State<SpleshScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();Timer(Duration(seconds: 10),
//             ()=>Navigator.pushReplacement(context,
//             MaterialPageRoute(builder:
//                 (context) =>
//                     MainOtpScreen(verificationid:'')
//             )
//         )
//     );
//
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//
//             Container(
//                 height: MediaQuery.of(context).size.height,
//                 width:MediaQuery.of(context).size.width,
//                 child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROUSDNHx4OFV-Rn7rwlAdP0GQuCB5uYBvDurYl9BFYSfBYJwVzQRIoC7_jQidxlFaXUWg&usqp=CAU'),fit: BoxFit.fill)),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
