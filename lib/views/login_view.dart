import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';

//log into an existing account
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //initialise textfield variables
  late final TextEditingController _email;
  late final TextEditingController _password;
  late Future _initapp;

  @override
  void initState() {
    //create
    _email = TextEditingController();
    _password = TextEditingController();
    _initapp = Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              );
    super.initState();
  }

  @override
  void dispose() {
    //dispose variables after use
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;
    double androidHeight = 800.0;
    double androidWidth = 360.0;
    return Scaffold(
      //hide app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      backgroundColor: Colors.white,
      //scrollable body
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //background image
            Image.asset("lib/images/Group 6.png"),

            FutureBuilder(
              future: _initapp,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {//check for connection
                  case ConnectionState.done:
                  // case ConnectionState.waiting:
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
                            ),//BoxDecoration
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),//Text

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
                                            style: BorderStyle.solid,
                                            color: Colors.black,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter),//BorderSide
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),//BorderRadius.all
                                      ),//OutlineInputBorder
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Email',
                                    ),//InputDecoration
                                  ),//TextField
                                ),//Container

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
                                            style: BorderStyle.solid,
                                            color: Colors.black,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter),//BorderSide
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),//BorderRadius.all
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.all(8.0),
                                      hintText: 'Password',
                                    ),//InputDecoration
                                  ),//TextField
                                ),//Container
                                const SizedBox(height: 30),

                                //verify Login Credentials
                                Container(
                                  width: (280/androidWidth*width),
                                  height: (40/androidHeight*height),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(250, 169, 19, 1),
                                      borderRadius: BorderRadius.circular(7.0),
                                      border: Border.all(color: Colors.black)),//BoxContainer
                                  child: TextButton(
                                    onPressed: () async {
                                      final email = _email.text;
                                      final password = _password.text;

                                      try {
                                        final userCredential =
                                            await FirebaseAuth.instance
                                                .signInWithEmailAndPassword(
                                                    email: email,
                                                    password: password);

                                        print(userCredential);
                                      } on FirebaseAuthException catch (e) {
                                        //var error = false;
                                        if (e.code == 'invalid-email') {
                                          print('invalid email');
                                        } else if (e.code ==
                                            'email-already-in-use')
                                          print('wrong password');
                                      }
                                      
                                      Navigator.pushNamed(context, '/HomePage');
                                    },
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
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 0, 162, 255)),//TextStyle
                                  ),//Text
                                )//TextButton
                              ],
                            ),//Column
                          ),//Container
                        ],
                      ),//Column
                    );//Center
                  default:
                    return const Text('Loading...');
                }
              },
            ),//FutureBuilder
          ],
        ),//Stack
      ),//SingleChildScrollable
    );//Scaffold
  }
}
