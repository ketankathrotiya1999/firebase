// import 'dart:math';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_miner/all/LoginScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../Screen/home.dart';
//
// class MainOtpScreen extends StatefulWidget {
//   String verificationid;
//    MainOtpScreen({super.key,required this.verificationid});
//
//   @override
//   State<MainOtpScreen> createState() => _MainOtpScreenState();
// }
//
// class _MainOtpScreenState extends State<MainOtpScreen> {
//   final FirebaseAuth Auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn =GoogleSignIn();
//   TextEditingController PhoneControler =TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextField(
//                 autofillHints:const<String> ['+919988776655'],
//
//                 controller: PhoneControler,
//                 keyboardType: TextInputType.phone,
//               ),
//             ),
//             // ElevatedButton(
//             //   onPressed: ()async{
//             //     await FirebaseAuth.instance.verifyPhoneNumber(
//             //       // phoneNumber: '+917990453991',
//             //       verificationCompleted: (PhoneAuthCredential credential) {},
//             //       verificationFailed: (FirebaseAuthException e) {},
//             //       codeSent: (String verificationId, int? resendToken) {
//             //         Navigator.push(context, MaterialPageRoute(
//             //           builder: (context) =>OtpScreen(
//             //             verificationid: verificationId,),));
//             //       },
//             //       codeAutoRetrievalTimeout: (String verificationId) {},
//             //       phoneNumber: PhoneControler.text.toString(),
//             //
//             //     );
//             //   },
//             //   child: Text('verification phone number'),
//             // ),
//             ElevatedButton(onPressed: ()async{
//               UserCredential? userCredential = await sighWithGoogle();
//               if(userCredential != null){
//                 Navigator.push(context,MaterialPageRoute(
//                   builder: (context) => HomePage(),));
//                 print('Google SignIn Successful user: ${userCredential.user?.displayName}');
//               }
//               else{
//                 print('Google SignIn Is Failed');
//               }
//             },
//                 child: Text(
//                     'Sign In With Google'
//                 )),
//             Spacer()
//
//           ],
//         ),
//       ),
//         onWillPop: () async {
//           return false;
//         }
//     );
//   }
//   Future<UserCredential?> sighWithGoogle() async{
//     try{
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       if(googleSignInAccount==null)
//       {
//         return null;
//       }
//
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//       final OAuthCredential googleAuthCreential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken
//       );
//       return await  Auth.signInWithCredential(googleAuthCreential);
//     }
//
//     catch(e){
//       print('Error during Google sign in: $e');
//       return null;
//     }
//   }
// }
//
