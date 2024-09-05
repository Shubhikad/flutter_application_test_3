// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/register_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertView extends StatelessWidget {
  const AlertView({super.key});
  final String _phoneNumber = '+919820158695';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(138, 19, 16, 1),
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color.fromRGBO(138, 19, 16, 1),
          foregroundColor: Colors.white,
          shadowColor: Colors.grey,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          title: const Text('ALERT AN ADULT'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 340,
                height : 60,
                child: Text(
                    'Alert a teacher or parent if you\'re in distress or need help',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                    )
                    ),
                    
              ),
              Divider(
                color: Colors.white
              ),
              Image.asset("lib/images/Warning_Sign.png"),
              SizedBox(
                height:  30,
              ),
              Container(
                height: 60,
                width:280,
                decoration: BoxDecoration(
                          color : Color.fromRGBO(250, 169, 19, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                child: TextButton(
                  onPressed: (){
                    launch('sms:+919820158695?body=I am in distress and require immediate assistance');
                    // final _call = 'tel:$_phoneNumber';
                    // if(await canLaunch(_call)){
                    //   await launch(_call);
                    // }
                  }, 
                  child: Text(
                    'ALERT A PARENT',
                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color.fromRGBO(138, 19, 16, 1)),
                                textAlign: TextAlign.left,
                  )
                  ),
              ),
              SizedBox(
                height:  50,
              ),
              Container(
                height: 60,
                width:280,
                
                decoration: BoxDecoration(
                          color : Color.fromRGBO(250, 169, 19, 1),
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                child: TextButton(
                  onPressed: (){}, 
                  child: Text(
                    'ALERT A TEACHER',
                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color.fromRGBO(138, 19, 16, 1)),
                                textAlign: TextAlign.left,
                  )
                  ),
              ),
            ],
          ),
        ));
  }
}
