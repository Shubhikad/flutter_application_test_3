import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/main.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200
            ),
            TextButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/PreView');
              }, 
              child: const Text('Logout')
              )
          ],
        ),
      )
    );
  }
}