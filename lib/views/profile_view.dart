// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/main.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  
  

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<String> docIds = [];
  final user = FirebaseAuth.instance.currentUser!;
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
        appBar: AppBar(
            title: Text(
              'Profile',
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color.fromRGBO(138, 19, 16, 1)),

        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (context, snapshot){
            if(snapshot.hasData){
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                return  Center(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 SizedBox(
                   height: 20,
                 ),
                 Icon(
                   Icons.person,
                   size: 120,
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  userData['username'],
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 38,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: Text(
                    ' Email :',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  color: const Color.fromARGB(255, 231, 231, 231),
                   child: Row(
                     children:  [
                    
                    
                          Expanded(
                           //flex: 6,
                           flex: 6,
                           child: Text(
                            '   ' + userData['email'],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                                              
                                               ),
                          ),
                    
                       Expanded(
                         flex :1,
                         child: Icon(
                           Icons.email,
                           size : 30,
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                Container(
                  width: 300,
                  child: Text(
                    ' Grade :',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  color: const Color.fromARGB(255, 225, 225, 225),
                  child: Row(
                    children: [
                   
                   
                         Expanded(
                          flex: 6,
                           child: Text(
                            '   ' + userData['grade'],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                                              
                                               ),
                         ),
                  
                     const Expanded(
                       flex :1,
                       child: Icon(
                         Icons.numbers,
                         size : 30,
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(
                 height: 20,
         
               ),
               Container(
                   width : 300,
                 child: Text(
                   ' Parent/Guardian\'s phone number :',
                   style: TextStyle(
                     fontSize: 20,
                   ),
                 ),
               ),
               SizedBox(
                 height: 10,
         
               ),
               Container(
                 height:50,
                 width : 300,
                   color: const Color.fromARGB(255, 222, 222, 222),
                   child: Row(
                     children: [
                    
                    
                          Expanded(
                          flex: 6,
                           child: Text(
                            '   ' + userData['parentcontact'],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                                              
                                               ),
                         ),
                       const Expanded(
                         flex :1,
                         child: Icon(
                           Icons.phone,
                           size : 30,
                         ),
                       ),
                     ],
                   ),
              
          
                 ),
               ],
             ),
           ),
         );
            }
            else if(snapshot.hasError){
              return Center(child: Text(('Error'+snapshot.error.toString())));
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }

            
          },
          ),
        
        );
  }
}