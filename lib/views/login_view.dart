import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/main_page.dart';
import 'package:flutter_application_test_3/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.transparent,
        foregroundColor: Colors.white,
        //shadowColor: Colors.grey,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        elevation: 2.0,
        //title: const Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("lib/images/Group 6.png"),
            
            FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 180),
                        
                        const SizedBox(height: 30),
                        Container(
                          height: 330,
                          width: 305,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                          'Welcome Back!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                              // const Text(
                              //   "EMAIL",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 20,
                              //       color: Colors.white),
                              // ),
                              const SizedBox(height: 20),
                              Container(
                                height: 50,
                                width: 280,
                                child: TextField(
                                  controller: _email,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 20.0,
                                        style : BorderStyle.solid,
                                        color: Colors.black,
                                        strokeAlign: BorderSide.strokeAlignCenter
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(8.0),
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                              
                              // const Text(
                              //   "PASSWORD",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 20,
                              //       color: Colors.white),
                              //   textAlign: TextAlign.left,
                              // ),
                              const SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: 280,
                                child: TextField(
                                  controller: _password,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.key),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 20.0,
                                        style : BorderStyle.solid,
                                        color: Colors.black,
                                        strokeAlign: BorderSide.strokeAlignCenter
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(8.0),
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: 280,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:  Color.fromRGBO(250, 169, 19, 1),
                                  borderRadius: BorderRadius.circular(7.0),
                                  border :Border.all(color :  Colors.black)
                                ),
                                child: TextButton(
                                  
                                  onPressed: () async {
                                    final email = _email.text;
                                    final password = _password.text;
                                          
                                    try {
                                      final userCredential = await FirebaseAuth
                                          .instance
                                          .signInWithEmailAndPassword(
                                              email: email, password: password);
                                          
                                      print(userCredential);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'invalid-email') {
                                        print('invalid email');
                                      } else if (e.code == 'email-already-in-use')
                                        print('wrong password');
                                    };
                                    Navigator.pushNamed(context, '/MainPage');
                                  },
                                  // style: const ButtonStyle(
                                  //   minimumSize: WidgetStatePropertyAll(Size(290, 20)),
                                
                                  //     backgroundColor:
                                  //         MaterialStatePropertyAll<Color>(
                                  //             Color.fromRGBO(250, 169, 19, 1))),
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  
                                  Navigator.pushNamed(context, '/Register');
                                },
                                child: const Text(
                                  "Not registered yet? Tap here",
                                  style: TextStyle(color: Color.fromARGB(255, 0, 162, 255)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                default:
                  return const Text('Loading...');
              }
            },
          ),
          ],
        ),
      ),
    );
  }
}
