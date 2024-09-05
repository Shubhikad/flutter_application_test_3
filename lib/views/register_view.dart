import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/main.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                          height: 650,
                          width: 330,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(138, 19, 16, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            
                            children: [
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
                                child: const TextField(
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
                                child: const TextField(
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
                                child: const TextField(
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
                                child: const TextField(
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
                                child: 
                                 
                                TextField(
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
                            const SizedBox(height: 13),
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
                                    Navigator.pushNamed(context, '/HomePage');
                                    print(userCredential);
                                  } on FirebaseAuthException catch (e) {
                                    print(e.code);
                                    if (e.code == 'weak-password') {
                                      const Text('weak password');
                                    } else if (e.code == 'email-already-in-use') {
                                      const Text('email already in use');
                                    } else if (e.code == 'invalid-email') {
                                      const Text('invalid email');
                                    }

                                  }

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
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                default:
                  return const Text('Loading...');
              }
            }
            ),
      ),
    );
  }
}
