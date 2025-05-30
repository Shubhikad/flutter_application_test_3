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
  // Removed _grade as it will be a Dropdown instead of TextField
  late final TextEditingController _parentname;
  late final TextEditingController _parentcontact;
  late final TextEditingController _passkey;

  // New state variable for the selected grade from the dropdown
  String? _selectedGrade;
  // List of available grades for the dropdown
  final List<String> _grades = List.generate(12, (index) => (index + 1).toString());


  var student = false;
  var parent = false;
  var admin = false;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _username = TextEditingController();
    // _grade is no longer a TextEditingController
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
    // _grade is no longer a TextEditingController, so no dispose needed
    _parentname.dispose();
    _parentcontact.dispose();
    _passkey.dispose();
    super.dispose();
  }

  // Function to show a SnackBar message
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //hide app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, // Make app bar transparent
        foregroundColor: Colors.white, // Set foreground (text/icon) color to white
        //shadowColor: Colors.grey,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        elevation: 2.0, // Add a subtle shadow
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
                          SingleChildScrollView(
                            child: Container(
                              height: 520,
                              width: 305,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Hello Student!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),

                                  //Text

                                  const SizedBox(height: 20),
                                  //check if student or admin
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 20,
                                        ),

                                        const SizedBox(width: 10),
                                        //Container
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ), //Row
                                  ), //SingleChildScrollView

                                  //textfields using user's information for firebase
                                  Container(
                                    height: 50,
                                    width: 280,
                                    child: TextField(
                                      controller: _username,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(8.0),
                                        hintText: 'Enter name',
                                      ), //InputDecoration
                                    ), //TextField
                                  ), //Container
                                  SizedBox(height: 5),

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
                                    ), //TextField
                                  ), //Container
                                  const SizedBox(height: 5),
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
                                    ), //TextField
                                  ), //Container
                                  

                                  Column(children: [
                                    const SizedBox(height: 5),
                                    // Grade Dropdown Field
                                    Container(
                                      height: 50,
                                      width: 280,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField<String>(
                                          value: _selectedGrade,
                                          hint: const Text('Select grade', style: TextStyle(fontWeight: FontWeight.normal, color: Color.fromARGB(255, 78, 78, 78)),),
                                          icon: const Icon(Icons.arrow_drop_down),
                                          isExpanded: true,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedGrade = newValue;
                                            });
                                          },
                                          items: _grades.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none, // Remove default underline
                                            contentPadding: EdgeInsets.zero, // Adjust padding
                                          ),
                                        ),
                                      ),
                                    ), //Container

                                    const SizedBox(height: 5),
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
                                      ), //TextField
                                    ), //Container

                                    const SizedBox(height: 5),

                                    Container(
                                      height: 50,
                                      width: 280,
                                      child: TextField(
                                        controller: _parentcontact,
                                        keyboardType: TextInputType.phone, // Set keyboard type to phone
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(Icons.phone),
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(8.0),
                                          hintText: 'Enter parent\'s phone number', //required escape sequence
                                        ), //InputDecoration
                                      ), //TextField
                                    ), //Container
                                    const SizedBox(height: 20),
                                    //Container
                                  ]),

                                  Container(
                                    width: 280,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(250, 169, 19, 1),
                                      borderRadius: BorderRadius.circular(7.0),
                                      border: Border.all(color: Colors.black),
                                    ), //BoxDecoration

                                    //submit user information to firebase
                                    child: TextButton(
                                      onPressed: () async {
                                        final email = _email.text.trim(); // Trim whitespace
                                        final password = _password.text.trim(); // Trim whitespace
                                        final username = _username.text.trim();
                                        final parentname = _parentname.text.trim();
                                        final parentcontact = _parentcontact.text.trim();
                                        final passkey = _passkey.text.trim();
                                        final grade = _selectedGrade;

                                        // --- Validation Checks ---

                                        // Username validation
                                        if (username.isEmpty) {
                                          _showSnackBar('Please enter your name.');
                                          return;
                                        }

                                        // Email validation
                                        if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                                          _showSnackBar('Please enter a valid email address.');
                                          return;
                                        }

                                        // Password validation
                                        if (password.length < 6) {
                                          _showSnackBar('Password must be at least 6 characters long.');
                                          return;
                                        }

                                        // Grade validation
                                        if (grade == null || grade.isEmpty) {
                                          _showSnackBar('Please select your grade.');
                                          return;
                                        }

                                        // Parent Name validation
                                        if (parentname.isEmpty) {
                                          _showSnackBar('Please enter your parent\'s name.');
                                          return;
                                        }

                                        // Parent Contact validation (basic check for digits and length)
                                        // Note: This is client-side format validation. For actual SMS verification,
                                        // Firebase Phone Authentication or a similar service would be required.
                                        if (parentcontact.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(parentcontact) || parentcontact.length < 10) {
                                          _showSnackBar('Please enter a valid phone number (digits only, at least 10 characters).');
                                          return;
                                        }

                                        // Passkey validation (if applicable)
                                        // Removed passkey validation for now as it's not present in the UI
                                        // if (passkey != '1234') {
                                        //   _showSnackBar('Incorrect passkey.');
                                        //   return;
                                        // }

                                        // --- End Validation Checks ---

                                        String? token = await FirebaseMessaging.instance.getToken();
                                        print(token);
                                        try {
                                          final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                            email: email,
                                            password: password,
                                          );

                                          // Send email verification
                                          await userCredential.user?.sendEmailVerification();
                                          _showSnackBar('Registration successful! Please check your email to verify your account.');

                                          FirebaseFirestore.instance
                                              .collection("Users")
                                              .doc(userCredential.user!.email)
                                              .set({
                                            'username': username,
                                            'grade': grade, // Use selected grade
                                            'parentname': parentname,
                                            'parentcontact': parentcontact,
                                            'email': email,
                                            'isStudent': true,
                                            'isAdmin': false,
                                            'token': token,
                                            // 'position': ,
                                          });

                                          print(userCredential);
                                          Navigator.pushNamed(context, '/Verification'); // Changed route to /Verification
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'weak-password') {
                                            _showSnackBar('The password provided is too weak.');
                                          } else if (e.code == 'email-already-in-use') {
                                            _showSnackBar('The account already exists for that email.');
                                          } else if (e.code == 'invalid-email') {
                                            _showSnackBar('The email address is not valid.');
                                          } else {
                                            _showSnackBar('Registration failed: ${e.message}');
                                          }
                                        } catch (e) {
                                          _showSnackBar('An unexpected error occurred: $e');
                                        }
                                      },
                                      style: const ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll<Color>(
                                              Color.fromRGBO(250, 169, 19, 1))),
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                            
                                            color: Color.fromARGB(255, 0, 0, 0)),
                                        textAlign: TextAlign.left,
                                      ), //Text
                                    ), //TextButton
                                  ),
                                ],
                              ), //Column
                            ),
                          ), //Container
                        ],
                      ), //Column
                    ); //Center

                  default:
                    return const Text('Loading...');
                }
              },
            ), //FutureBuilder
          ],
        ), //Stack
      ), //SingleChildScrollView
    ); //Scaffold
  }
}
