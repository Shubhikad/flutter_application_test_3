import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/views/login_view.dart';
import 'package:flutter_application_test_3/views/main_page.dart';


class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});
  
 
  
  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text('Verification'),
        ),
        body: 
         Column(children: [
          
          TextButton(
            onPressed: () async {
              await Firebase.initializeApp();
              print(FirebaseAuth.instance.currentUser);
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
              // late Timer timer;   
              // timer=Timer(const Duration(seconds: 5), (timer){

              // });
      
              },            
            child: const Text('send email verification'),
          )
          
        ]
        
      )
      
    );
  }
}