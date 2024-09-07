// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _username;
  late final TextEditingController _grade;
  late final TextEditingController _parentname;
  late final TextEditingController _parentcontact;

  var student = false;
  var parent = false;
  var teacher = false;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _username = TextEditingController();
    _grade = TextEditingController();
    _parentname = TextEditingController();
    _parentcontact = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _grade.dispose();
    _parentname.dispose();
    _parentcontact.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.transparent,
        foregroundColor: Colors.white,
        //shadowColor: Colors.grey,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        elevation: 2.0,
        //title: const Text('Register'),
      ),
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
                          const SizedBox(height: 140),
                          Container(
                            height: 550,
                            width: 305,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height:20),
                                Text('Hello!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                
                                ),
                                
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              student = !student;
                                              parent = false;
                                              teacher = false;
                                            });
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: student
                                                  ? Color.fromRGBO(
                                                      250, 169, 19, 1)
                                                  : Color.fromRGBO(1, 2, 3, 0),
                                              border: Border(
                                                top: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                left: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                right: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                bottom: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'STUDENT',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width:10),
                                      Container(
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              student = false;
                                              parent = false;
                                              teacher = !teacher;
                                            });
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: teacher
                                                  ? Color.fromRGBO(
                                                      250, 169, 19, 1)
                                                  : Color.fromRGBO(1, 2, 3, 0),
                                              border: Border(
                                                top: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                left: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                right: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                bottom: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            
                                            child: Center(
                                              child: Text(
                                                'TEACHER',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      
                                    ],
                                  ),
                                ),
                                
                                
                                
                                Container(
                                  height: 50,
                                  width: 280,
                                  child: TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Enter name',
                                    ),
                                  ),
                                ),
                                SizedBox(height:5),
                                
                                Container(
                                  height: 50,
                                  width: 280,
                                  child: TextField(
                                    controller: _email,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Enter email',
                                    ),
                                  ),
                                ),
                                SizedBox(height:5),
                                Container(
                                  height: 50,
                                  width: 280,
                                  child: TextField(
                                    controller: _password,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Enter password',
                                    ),
                                  ),
                                ),
                                Column(children: [
                                SizedBox(height:5),  
                                  Container(
                                    height: 50,
                                    width: 280,
                                    child: TextField(
                                      controller: _grade,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(8.0),
                                        hintText: 'Enter grade',
                                      ),
                                    ),
                                  ),
                                  
                                  SizedBox(height:5),
                                  Container(
                                    height: 50,
                                    width: 280,
                                    child: TextField(
                                      controller: _parentname,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(8.0),
                                        hintText: 'Enter parent\'s name',
                                      ),
                                    ),
                                  ),
                                  
                                  SizedBox(height:5),
                                  Container(
                                    height: 50,
                                    width: 280,
                                    child: TextField(
                                      controller: _parentcontact,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(8.0),
                                        hintText: 'Enter parent\s phone number',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: 280,
                                height: 42,
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
                                              .createUserWithEmailAndPassword(
                                            email: email,
                                            password: password,
                                          );
                                              
                                          FirebaseFirestore.instance
                                              .collection("Users")
                                              .doc(userCredential.user!.email)
                                              .set({
                                            'username': _username.text,
                                            'grade': _grade.text,
                                            'parentname': _parentname.text,
                                            'parentcontact': _parentcontact.text,
                                            'email': _email.text,
                                            'password': _password.text,
                                            'isStudent':student,
                                            'isTeacher':teacher,
                                            'isParent':parent,
                                            // 'position': ,
                                          });
                                              
                                          print(userCredential);
                                        } on FirebaseAuthException catch (e) {
                                          
                                          print(e.code);
                                          if (e.code == 'weak-password') {
                                          // await FirebaseAuth.instance.currentUser!.delete();
                                          // FirebaseAuth.instance.signOut();
                                          } else if (e.code ==
                                              'email-already-in-use') {
                                            // Navigator.pushNamed(context, '/ErrorEmailView');
                                          } else if (e.code == 'invalid-email') {
                                            // Navigator.pushNamed(context, '/InvalidEmail');
                                          }
                                              
                                          
                                              
                                          // Navigator.pushNamed(context, '/HomePage');
                                        }
                                        Navigator.pushNamed(context, '/HomePage');
                                        // await FirebaseAuth.instance.currentUser?.updateDisplayName(_username.text);
                                        // await FirebaseAuth.instance.currentUser?.updateDisplayName(_username.text);
                                        // await FirebaseAuth.instance.currentUser?.updateDisplayName(_username.text);
                                        // await FirebaseAuth.instance.currentUser?.updateDisplayName(_username.text);
                                        // await FirebaseAuth.instance.currentUser?.updateDisplayName(_username.text);
                                      },
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  Color.fromRGBO(250, 169, 19, 1))),
                                      child: const Text(
                                        
                                        'Register',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                            color: Color.fromARGB(255, 0, 0, 0)),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  
                  default:
                    return const Text('Loading...');
                }
              }),
          ],
        ),
      ),
    );
  }
}
