// ignore_for_file: prefer_const_constructors

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(138, 19, 16, 1),
        foregroundColor: Colors.white,
        shadowColor: Colors.grey,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        elevation: 2.0,
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          height: 740,
                          width: 330,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(138, 19, 16, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                "POSITION",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  
                                  children: [
                                    SizedBox(
                                      width: 10,
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
                                          height: 40,
                                          width: 80,
                                
                                      decoration: BoxDecoration(
                                        color: student?Color.fromRGBO(250, 169, 19, 1):Color.fromRGBO(1, 2, 3, 0),
                                        border: Border(
                                          top: BorderSide(color: Color(0xFFFFFFFF)),
                                          left:
                                              BorderSide(color: Color(0xFFFFFFFF)),
                                          right: BorderSide(color: Color(0xFFFFFFFF)),
                                          bottom: BorderSide(color: Color(0xFFFFFFFF)),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      ),
                                          child: Center(
                                            child: Text(
                                              'STUDENT',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                                  
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            student = false;
                                          parent = !parent;
                                          teacher = false;
                                          });
                                          
                                
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                
                                      decoration: BoxDecoration(
                                        color: parent?Color.fromRGBO(250, 169, 19, 1):Color.fromRGBO(1, 2, 3, 0),
                                        border: Border(
                                          top: BorderSide(color: Color(0xFFFFFFFF)),
                                          left:
                                              BorderSide(color: Color(0xFFFFFFFF)),
                                          right: BorderSide(color: Color(0xFFFFFFFF)),
                                          bottom: BorderSide(color: Color(0xFFFFFFFF)),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      ),
                                          child: Center(
                                            child: Text(
                                              'PARENT',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                                  
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

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
                                          height: 40,
                                          width: 80,
                                
                                      decoration: BoxDecoration(
                                        color: teacher?Color.fromRGBO(250, 169, 19, 1):Color.fromRGBO(1, 2, 3, 0),
                                        border: Border(
                                          top: BorderSide(color: Color(0xFFFFFFFF)),
                                          left:
                                              BorderSide(color: Color(0xFFFFFFFF)),
                                          right: BorderSide(color: Color(0xFFFFFFFF)),
                                          bottom: BorderSide(color: Color(0xFFFFFFFF)),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      ),
                                          child: Center(
                                            child: Text(
                                              'TEACHER',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                                  
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                
                                    SizedBox(
                                      width: 20,
                                    ),
                                
                                    Container(
                                      height: 40,
                                      width: 90,
                                
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Color(0xFFFFFFFF)),
                                          left:
                                              BorderSide(color: Color(0xFFFFFFFF)),
                                          right: BorderSide(color: Color(0xFFFFFFFF)),
                                          bottom: BorderSide(color: Color(0xFFFFFFFF)),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'PARENT',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                
                                    SizedBox(
                                      width: 20,
                                    ),
                                
                                    
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 10),
                              const Text(
                                "NAME",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
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
                               const SizedBox(height: 10),
                              const Text(
                                  "EMAIL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              const SizedBox(height: 10),
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
                              const SizedBox(height: 10),
                              const Text(
                                "PASSWORD",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
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
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(8.0),
                                    hintText: 'Enter password',
                                  ),
                                ),
                              ),
                              












                              
                              Column(
                                children: [
                                const SizedBox(height: 10),
                                const Text(
                                  "GRADE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 10),
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
                                const SizedBox(height: 10),
                                const Text(
                                  "PARENT/ GUARDIAN'S NAME",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 10),
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
                                      hintText: 'Enter name',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "PARENT/ GUARDIAN'S EMAIL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 10),
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
                                      hintText: 'Enter email',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),



                                TextButton(
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
                                      // 'position': ,
                                      
                                    });

                                    print(userCredential);
                                  } on FirebaseAuthException catch (e) {
                                    print(e.code);
                                    if (e.code == 'weak-password') {
                                      const Text('weak password');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      const Text('email already in use');
                                    } else if (e.code == 'invalid-email') {
                                      const Text('invalid email');
                                    }

                                    Navigator.pushNamed(context, '/HomePage');
                                  }
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                                ]
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
            }),
      ),
    );
  }
}
