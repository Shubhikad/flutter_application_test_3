import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/register_view.dart';

class PreView extends StatelessWidget {
  const PreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'APP NAME',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 54,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              const SizedBox(height: 300),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Register');
                },
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(200, 20)),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(138, 19, 16, 1))),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 80),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(200, 20)),

                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(138, 19, 16, 1),
                  ),
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ));
  }
}
