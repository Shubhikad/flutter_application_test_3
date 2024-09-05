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
              child: Icon(
                Icons.circle,
                size: 48,
                )
              ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('H O M E'),

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('P R O F I L E'),

            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('L O G O U T'),

            )
          ],
        ),
      ),
    );
  }
}