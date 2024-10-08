// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

//display the user's profile
class _FormViewState extends State<FormView> {
  //get firebase elements
  final CollectionReference forms =
      FirebaseFirestore.instance.collection('ReportingForm');
  Stream<QuerySnapshot> getFormsStream() {
    final formsStream = forms.snapshots();
    return formsStream;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Colors.transparent,
          title: Text('Form Responses',
          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,),),
          leading: new IconButton(
            onPressed: (){
              
              Navigator.pushNamed(context, '/MainPage');
              

            }, 
            icon: new Icon(Icons.arrow_back, color: Colors.black),
),
      ),


      body: StreamBuilder<QuerySnapshot>(
        stream: getFormsStream(),
        builder: (context, snapshot) {
          //checking for user
          if (snapshot.hasData) {
            List formList = snapshot.data!.docs;

            return 
                  ListView.builder(
                    itemCount: formList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = formList[index];
                          
                  
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                         
                  
                      return Column(
                        children: [

                                Container(
                                  height: 300,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: Colors.black)),//BoxDecoration
                                    padding: EdgeInsets.all(8.0),
                                 
                                  child: SingleChildScrollView(
                                    child: Column(
                                    
                                    children: [
                                     Text('date :' + data['date'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                      // textAlign: TextAlign.left  ,
                                      ),
                                    //   Text('time: ' + data['time'],
                                    // style: TextStyle(
                                    //     fontWeight: FontWeight.w400,
                                    //     fontSize: 18,
                                    //   ),),
                                    
                                      Text('type: ' + data['type'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),),
                                    
                                      Text('location: ' + data['location'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),),
                                    
                                    
                                      
                                    Text('bully 1: ' +
                                      data['bully1'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ), 
                                    Visibility(
                                      visible: !(data['bully2']==""),
                                      child: Text('bully 2: ' +
                                        data['bully2'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: data['bully3']!="",
                                      child: Text('bully 3: ' +
                                        data['bully3'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),  
                                    
                                    Text('victim: ' +
                                      data['victim1'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ), 
                                    Visibility(
                                      visible: data['victim2']!="",
                                      child: Text('victim 2: ' +
                                        data['victim2'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: data['victim3']!="",
                                      child: Text('victim 3: ' +
                                        data['victim3'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ), 
                                    
                                    Visibility(
                                      visible: data['witness1']!="",
                                      child: Text('witness: ' + data['witness1'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),)
                                    ),
                                    Visibility(
                                      visible: data['witness2']!="",
                                      child: Text('witness 2: ' + data['witness2'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),)
                                    ),
                                    Visibility(
                                      visible: data['witness3']!="",
                                      child: Text('witness 3: ' + data['witness3'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),)
                                    ),   
                                    
                                    
                                    Text('details: ' + data['details'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),)
                                    ],
                                   ),
                                  ),
                                ),
                                SizedBox(height:20)
                              ],
                           
                  
                            
                          );
                    },
                  );
             
            //Check for errors
          } else if (snapshot.hasError) {
            return Center(child: Text(('Error' + snapshot.error.toString())));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ), //StreamBuilder
    ); //Scaffold
  }

   
}
