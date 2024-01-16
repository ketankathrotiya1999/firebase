// import 'dart:math';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../Screen/home.dart';
//
// class OtpScreen extends StatefulWidget {
//   String verificationid;
//   OtpScreen({super.key,required this.verificationid});
//
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//
//   TextEditingController OtpController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: TextField(
//                 controller:OtpController ,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                     hintText: 'Enter Otp',
//                     suffixIcon: Icon(Icons.phone),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//
//
//                     )
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(onPressed: ()async{
//               try {
//                 PhoneAuthCredential credential=PhoneAuthProvider.credential(
//                     verificationId: widget.verificationid,
//                     smsCode: OtpController.text.toString());
//
//                 UserCredential usercredential = await  FirebaseAuth.instance.signInWithCredential(credential);
//                 if(usercredential.user!=null){
//                   Navigator.of(context).push(
//                       MaterialPageRoute(
//                     builder: (context) => HomePage(),));
//                 }
//                 else{
//                   print('faild to siging ');
//                 }
//               }
//               catch (e){
//                 log(e.toString() as num);
//               }
//             }, child: Text('submit otp')),
//
//           ],
//         ),
//       ),
//         onWillPop: () async {
//           return false;
//         }
//     );
//   }
// }
