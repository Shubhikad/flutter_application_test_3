import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/register_view.dart';

class ErrorEmailView extends StatelessWidget {
  const ErrorEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height : 300
          ),
          const Text('Wrong Email or Password'),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/PreView');
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(250, 169, 19, 1))),
            child: const Text(
              'Return to screen',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}

class InvalidEmail extends StatelessWidget {
  const InvalidEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height : 300
          ),
          const Text('Weak Password'),
          TextButton(
            onPressed: () async {
               await FirebaseAuth.instance.currentUser!.delete();

              Navigator.pop(context);
              Navigator.pushNamed(context, '/PreView');
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(250, 169, 19, 1))),
            child: const Text(
              'Return to screen',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}

class ErrorPasswordView extends StatelessWidget {
  const ErrorPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height : 300
          ),
          const Text('Weak Password'),
          TextButton(
            onPressed: () {
               
              Navigator.pop(context);
              Navigator.pushNamed(context, '/PreView');
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(250, 169, 19, 1))),
            child: const Text(
              'Return to screen',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}