import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/alert_view.dart';
import 'package:flutter_application_test_3/views/error_view.dart';
import 'package:flutter_application_test_3/views/login_view.dart';
import 'package:flutter_application_test_3/views/main_page.dart';
import 'package:flutter_application_test_3/views/pre_view.dart';
import 'package:flutter_application_test_3/views/profile_view.dart';
import 'package:flutter_application_test_3/views/register_view.dart';
import 'package:flutter_application_test_3/views/verify_email.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AlertView(),
      routes: {
        '/Login': (context) => const LoginView(),
        '/Register': (context) => const RegisterView(),
        '/MainPage': (context) => const MainPage(),
        '/HomePage': (context) => const HomePage(),
        '/Profile': (context) => const ProfileView(),
        '/PreView': (context) => const PreView(),
        '/ErrorEmailView': (context) => const ErrorEmailView(),
        '/ErrorPasswordView': (context) => const ErrorPasswordView(),
         '/InvalidEmail': (context) => const InvalidEmail(),
        
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                final emailVerified = user?.emailVerified ?? false;
                print(user);
                if (user == null) {
                  return const PreView();
                // } else if (snapshot.hasData && !emailVerified) {
                //   return const VerifyEmailView();
                } else if (snapshot.hasData) {
                  return const MainPage();
                } else {
                  return const PreView();
                }
              //return const Text('done');

              default:
                return const Text('Loading...');
            }
          } //test
          ),
    );
  }
}
