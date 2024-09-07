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
              Row(
                children: [
                  Expanded(flex : 1, child: const SizedBox(width: 30)),
                  Expanded(flex: 2,child: Image.asset("lib/images/Aditya Birla Logo 1.png",)),
                ],
              ),
              
              const Text(
                'APP NAME',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 54,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              const SizedBox(height: 200),
              Container(
                 width: 280,
                                height: 60,
                                    decoration: BoxDecoration(
                                  color:  Color.fromRGBO(250, 169, 19, 1),
                                  borderRadius: BorderRadius.circular(7.0),
                                  border :Border.all(color :  Colors.black)
                                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Register');
                  },
                  style: ButtonStyle(
                    
                    backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(250, 169, 19, 1)),
                    
                   
                    ),
                    
                    
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                 width: 280,
                                height: 60,
                                    decoration: BoxDecoration(
                                  color:  Color.fromRGBO(250, 169, 19, 1),
                                  borderRadius: BorderRadius.circular(7.0),
                                  border :Border.all(color :  Colors.black)
                                ),
                child: TextButton(
                  onPressed: () {
                    
                    Navigator.pushNamed(context, '/Login');
                  },
                  style: ButtonStyle(
                    
                
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(250, 169, 19, 1),
                    ),
                    
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
