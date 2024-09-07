import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/register_view.dart';

 class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("lib/images/Aditya Birla Logo.png"),
              ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('H O M E'),
              onTap: (){
                Navigator.pushNamed(context, '/MainPage');
              },
              

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('P R O F I L E'),
              onTap: (){
                Navigator.pushNamed(context, '/Profile');
              },

            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('L O G O U T'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/PreView');
                },

            ),
            // ListTile(
            //   leading: Icon(Icons.exit_to_app),
            //   title: Text('D E L E T E'),
            //   onTap: () {
            //     FirebaseAuth.instance.currentUser!.delete();
            //       Navigator.pop(context);
            //       Navigator.pushNamed(context, '/PreView');
            //     },

            // ),
          ],
        ),
      ),
    );
  }
}