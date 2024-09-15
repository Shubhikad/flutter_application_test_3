//import packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//register a new user
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  //initialise variables
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _username;
  late final TextEditingController _grade;
  late final TextEditingController _parentname;
  late final TextEditingController _parentcontact;
  late final TextEditingController _passkey;

  var student = false;
  var parent = false;
  var admin = false;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _username = TextEditingController();
    _grade = TextEditingController();
    _parentname = TextEditingController();
    _parentcontact = TextEditingController();
    _passkey = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    //dispose variables after use
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _grade.dispose();
    _parentname.dispose();
    _parentcontact.dispose();
    _passkey.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //hide app bar
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
      //make scrollable when text fields are used
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //background image
            Image.asset("lib/images/Group 6.png"),
            FutureBuilder(
              //inistialise firebase
              future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              ),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  //check for connection
                  case ConnectionState.done:
                    return Center(
                      child: Column(
                        children: [
                          //create layout
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
                                const SizedBox(height:20),
                                const Text('Hello!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                
                                ),//Text
                                //check if student or admin 
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              student = !student;
                                              parent = false;
                                              admin = false;
                                            });
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: student
                                                  ? const Color.fromRGBO(
                                                      250, 169, 19, 1)
                                                  : const Color.fromRGBO(1, 2, 3, 0),
                                              border: const Border(
                                                top: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                left: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                right: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                bottom: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                              ),//Border
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),//BoxDecoration
                                            child: const Center(
                                              child: Text(
                                                'STUDENT',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                textAlign: TextAlign.left,
                                              ),//Text
                                            ),//Center
                                          ),//Container
                                        ),//TextButton
                                      ),//Container
                                      const SizedBox(width:10),
                                      Container(
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              student = false;
                                              parent = false;
                                              admin = !admin;
                                            });
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: admin
                                                  ? const Color.fromRGBO(
                                                      250, 169, 19, 1)
                                                  : const Color.fromRGBO(1, 2, 3, 0),
                                              border: const Border(
                                                top: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                left: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                right: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                bottom: BorderSide(
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                              ),//Border
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),//BoxDecoration
                                            
                                            child: const Center(
                                              child: Text(
                                                'ADMIN',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Color.fromARGB(255, 0, 0, 0)),
                                                textAlign: TextAlign.left,
                                              ),//Text
                                            ),//Center
                                          ),//Container
                                        ),//TextBox
                                      ),//Container
                                      SizedBox(
                                        width: 20,
                                      ),
                                      
                                    ],
                                  ),//Row
                                ),//SingleChildScrollView
                                
                                
                               //textfields using user's information for firebase 
                                Container(
                                  height: 50,
                                  width: 280,
                                  child: TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.abc),
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Enter name',
                                    ), //InputDecoration
                                  ),//TextField
                                ),//Container
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
                                      suffixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Enter email',
                                    ), //InputDecoration
                                  ),//TextField
                                ),//Container
                                const SizedBox(height:5),
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
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Enter password',
                                    ), //InputDecoration
                                  ),//TextField
                                ),//Container
                                Visibility(
                                  visible : admin,
                                  child: Column(children: [
                                  const SizedBox(height:5),  
                                    Container(
                                      height: 50,
                                      width: 280,
                                      child: TextField(
                                        controller: _passkey,
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(Icons.numbers),
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(8.0),
                                          hintText: 'Enter admin passkey',
                                        ), //InputDecoration
                                      ),//TextField
                                    ),//Container
                                  ]
                                  ),//Column
                                ),

                                Visibility(
                                  visible : student,
                                  child: Column(children: [
                                  const SizedBox(height:5),  
                                    Container(
                                      height: 50,
                                      width: 280,
                                      child: TextField(
                                        controller: _grade,
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(Icons.numbers),
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(8.0),
                                          hintText: 'Enter grade',
                                        ), //InputDecoration
                                      ),//TextField
                                    ),//Container
                                    
                                    const SizedBox(height:5),
                                    Container(
                                      height: 50,
                                      width: 280,
                                      child: TextField(
                                        controller: _parentname,
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(Icons.abc),
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(8.0),
                                          hintText: 'Enter parent\'s name',
                                        ), //InputDecoration
                                      ),  //TextField
                                    ),    //Container
                                    
                                    const SizedBox(height:5),

                                    Container(
                                      height: 50,
                                      width: 280,
                                      child: TextField(
                                        controller: _parentcontact,
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(Icons.phone),
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(8.0),
                                          hintText: 'Enter parent\s phone number',//required escape sequence
                                        ),//InputDecoration
                                      ),//TextField
                                    ),//Container
                                    const SizedBox(height: 20),
                                    //Container
                                  ]
                                  ),//Column
                                ),
                                
                                    Container(
                                      width: 280,
                                  height: 42,
                                      decoration: BoxDecoration(
                                    color:  const Color.fromRGBO(250, 169, 19, 1),
                                    borderRadius: BorderRadius.circular(7.0),
                                    border :Border.all(color :  Colors.black)
                                  ),//BoxDecoration
                                  
                                  //submit user information to firebase
                                      child: TextButton(
                                        onPressed: () async {
                                          final email = _email.text;
                                          final password = _password.text;
                                          final passkey = _passkey.text;
                                          String? token = await FirebaseMessaging.instance.getToken();
                                          print(token);
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
                                              'isAdmin':admin,
                                              'isParent':parent,
                                              'token' : token,
                                              // 'position': ,
                                            });
                                                
                                            print(userCredential);
                                          } on FirebaseAuthException catch (e) { 
                                            if (e.code == 'invalid-email') {
                                              print('invalid email');
                                            } else if (e.code ==
                                              'email-already-in-use') {
                                              print('wrong password');

                                            } else if (passkey != '1234') {
                                              print('incorrect passkey');
                                            }
                                          }
                                          Navigator.pushNamed(context, '/HomePage');
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
                                        ),//Text
                                      ),//TextButton
                                    ),
                              ],
                            ),//Column
                          ),//Container
                        ],
                      ),//Column
                    );//Center
                  
                  default:
                    return const Text('Loading...');
                }
              }),//FutureBuilder
          ],
        ),//Stack
      ),//SingleChildScrollView
    );//Scaffold
  }
}
