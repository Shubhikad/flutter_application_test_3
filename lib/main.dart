import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/about_bullying.dart';
import 'package:flutter_application_test_3/views/alert_view.dart';
import 'package:flutter_application_test_3/views/form_view.dart';
import 'package:flutter_application_test_3/views/login_view.dart';
import 'package:flutter_application_test_3/views/main_page.dart';
import 'package:flutter_application_test_3/views/pre_view.dart';
import 'package:flutter_application_test_3/views/profile_view.dart';
import 'package:flutter_application_test_3/views/register_view.dart';
import 'package:flutter_application_test_3/views/reporting_form1.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:flutter_application_test_3/views/reportingform_view.dart';
import 'package:flutter_application_test_3/views/verification_page.dart';
import 'package:location/location.dart' as loc;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<bool> requestStoragePermission() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    status = await Permission.storage.request();
  }
  return status.isGranted;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  loc.Location location = loc.Location();

  loc.PermissionStatus _permissionGranted;

  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    provisional: true,
  );

  bool storagePermissionGranted = await requestStoragePermission();
  if (!storagePermissionGranted) {
    // You can choose to show a message or exit app here if storage permission is essential
    print("Storage permission denied. The app may not work correctly.");
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == loc.PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != loc.PermissionStatus.granted) {
      return;
    }
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ), //Theme Data

      //main page to be run
      home: const HomePage(),
      //routes to various pages
      routes: {
        '/Login': (context) => const LoginView(),
        '/Register': (context) => const RegisterView(),
        '/MainPage': (context) => const MainPage(),
        '/HomePage': (context) => const HomePage(),
        '/Profile': (context) => const ProfileView(),
        '/PreView': (context) => const PreView(),
        '/AboutBullying': (context) => const AboutBullying(),
        '/ReportingFormView': (context) => const BullyingReportingForm(),
        '/AntibullyingSquadView': (context) => const AntibullyingSquadView(),
        '/AlertView': (context) => const AlertView(),
        '/FormView': (context) => const FormView(),
        '/Verification': (context) => const VerificationPage(),
        
      }));
  //MaterialApp
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
          //initialise firebase
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //check if firebase is connected
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                //final emailVerified = user?.emailVerified ?? false;
                //check if a user already exists on the device

                if (user == null) {
                  return const PreView();
                } else if (snapshot.hasData) {
                  return const MainPage();
                } else {
                  return const PreView();
                }

              default:
                return const Text('Loading...');
            }
          } //test
          ), //FutureBuilder
    ); //Scaffold
  }
}
