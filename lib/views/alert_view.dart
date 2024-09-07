// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/register_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertView extends StatefulWidget {
  const AlertView({super.key});
  
  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  
  final user = FirebaseAuth.instance.currentUser!;
  
  List<String> docIds = [];
    Future getDocId() async {
    await FirebaseFirestore.instance.collection('Users').get().then(
    (snapshot)=>snapshot.docs.forEach((element){
      print(element.reference);
      docIds.add(element.reference.id);
    }));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor:  Colors.transparent,
          foregroundColor: Colors.white,
          //shadowColor: Colors.grey,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          //title: const Text('ALERT AN ADULT'),
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final String _phoneNumber = userData['parentcontact'];
            return Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Image.asset("lib/images/Rectangle 19.png"),
                      
                      Center(
                        child: Column(
                        children: [
                          SizedBox(
                            height:  110,
                          ),
                          Image.asset("lib/images/image 2.png"),
                          SizedBox(
                            height:  40,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:20
                              ),
                              Container(
                                height: 60,
                                width:150,
                                decoration: BoxDecoration(
                                          color : Color.fromRGBO(179, 25, 22, 1),
                                          borderRadius: BorderRadius.circular(20),
                                          border :Border.all(color :  Colors.black)
                                        ),
                                        
                                child: TextButton(
                                  onPressed: (){
                                    launch('sms:$_phoneNumber?body=I am in distress and require immediate assistance');
                                    // final _call = 'tel:$_phoneNumber';
                                    // if(await canLaunch(_call)){
                                    //   await launch(_call);
                                    // }
                                  }, 
                                  child: Text(
                                    'Parent',
                                    style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                                textAlign: TextAlign.left,
                                  )
                                  ),
                              ),
                              SizedBox(
                                width:  20,
                              ),
                              Container(
                                height: 60,
                                width:150,
                                
                                decoration: BoxDecoration(
                                          color : Color.fromRGBO(179, 25, 22, 1),
                                          borderRadius: BorderRadius.circular(20),
                                           border :Border.all(color :  Colors.black)
                                          
                                        ),
                                child: TextButton(
                                  onPressed: (){}, 
                                  child: Text(
                                    'Teacher',
                                    style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                                textAlign: TextAlign.left,
                                  )
                                  ),
                              ),
                            ],
                          ),
                        ],
                                    ),
                      ),
                    ],
                  ),
                  
                ),
                SizedBox(height: 40,),
                Text('Alert a teacher or a parent if you\'re in distress or need help',
                style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 25,
                                                color: Color.fromARGB(255, 0, 0, 0)),
                                                textAlign: TextAlign.center,
                                                ),
                                                Text('An sms will be sent to this number to alert them that you are in need of assistance.',
                style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18,
                                                color: Color.fromARGB(255, 0, 0, 0)),
                                                textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 20,),
                                                Container(
                                                  width: 200,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(color :  Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                                  child: Text('$_phoneNumber',
                                                                  style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(255, 0, 0, 0)),
                                                  textAlign: TextAlign.center,
                                                  ),
                                                ),
              ],
            );
          }
          else if(snapshot.hasError){
              return Center(child: Text(('Error'+snapshot.error.toString())));
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        ));
  }
  }
