import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
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
        title: const Text('Login'),
      ),
      backgroundColor: Colors.white,
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
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            color: Color.fromRGBO(138, 19, 16, 1)),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 350,
                        width: 330,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(138, 19, 16, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
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
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextButton(
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
                                  if (e.code == 'invalid-email')
                                    print('invalid email');
                                  else if (e.code == 'email-already-in-use')
                                    print('wrong password');
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Color.fromRGBO(250, 169, 19, 1))),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                                textAlign: TextAlign.left,
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
      ),
    );
  }
}
