import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; // import the basic package
import 'package:flutter_application_test_3/firebase_options.dart'; // import the tools for firebase
import 'package:flutter_screenutil/flutter_screenutil.dart'; // import the tools needed to adjust the screensize

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() =>
      _PasswordViewState(); // create a state to keep track of changing variables
}

class _PasswordViewState extends State<PasswordView> {
  late final TextEditingController _password;
  bool pass = true;
  bool passwordSubmitted = false;

  void initState() {
    // stores all text fields as controllers
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // disposes of all text fields which are controllers
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 800),
        builder: (context, child) {
          const bigButtonTextStyle = TextStyle(
            // creates a title text style
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Open Sans',
            letterSpacing: 0.5,
            fontSize: 24,
            height: 2,
            decoration: TextDecoration.none,
          );

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: 
                Stack(
                  
                  children: [
                    Image.asset("lib/images/Group 6.png"),
                    Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 350.sp,),
                        Align(
                          // password text field
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 300.0.sp,
                            height: 60.0.sp,
                            child: TextField(
                              controller: _password,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 20.0,
                                      style: BorderStyle.solid,
                                      color: Colors.black,
                                      strokeAlign: BorderSide.strokeAlignCenter),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(10.0),
                                hintText: 'Enter password to access forms',
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          // submit button
                          onPressed: () {
                            if (_password.text == "1234") {
                              Navigator.pushNamed(context, '/FormView');
                            } else {
                              pass = false;
                            }
                            passwordSubmitted = true;
                          },
                
                          style: ElevatedButton.styleFrom(
                            backgroundColor: passwordSubmitted
                                ? Color(0xFFF2BE0F)
                                : const Color(0xFFEB7C10),
                            foregroundColor: Colors.white,
                            side: BorderSide(color: Colors.white, width: 2.0),
                          ),
                          child: Text(
                            'Submit',
                            style: bigButtonTextStyle.copyWith(
                              fontSize: 24.0.sp,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !pass,
                          child: Container(
                            // creates a container to store text
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10.0.sp),
                            child: Text(
                              'Incorrect Password',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              
            ),
          );
        });
  }
}
