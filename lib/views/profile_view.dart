// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

//display the user's profile
class _ProfileViewState extends State<ProfileView> {
  //get firebase elements
  List<String> docIds = [];
  final user = FirebaseAuth.instance.currentUser!;
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIds.add(element.reference.id);
            }));
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;
    double androidHeight = 800.0;
    double androidWidth = 360.0;
    return Scaffold(
      //hide appbar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Colors.transparent),

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          //checking for user 
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Center(
              child: SingleChildScrollView(
                child: Stack(children: [
                  Image.asset("lib/images/Android Large - 8.png"),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: (200/androidWidth)*width,
                        ),
                        Icon(
                          Icons.person,
                          size: 120,
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        //display name
                        Text(
                          userData['username'],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 38,
                          ),//TextStyle
                        ),//Text
                        SizedBox(
                          height: 20,
                        ),//SizedBox
                        SizedBox(
                          height: 10,
                        ),//SizedBox
                        Container(
                          height: 50,
                          width: (300/androidWidth)*width,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: Colors.black)),//BoxDecoration
                          child: Row(
                            children: [
                              //display email
                              Expanded(
                                //flex: 6,
                                flex: 6,
                                child: Text(
                                  '   ' + userData['email'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),//TextStyle
                                ),//Text
                              ),//Expanded
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.email,
                                  size: 30,
                                ),//Icon
                              ),//Expanded
                            ],
                          ),//Row
                        ),//Container
                        SizedBox(
                          height: 10,
                        ),//SizedBox
                        
                        Visibility(
                          visible: userData['isStudent'],
                          child: Column(
                            children: [
                              Container(
                          height: 50,
                          width: (300/androidWidth)*width,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: Colors.black)),//BoxDecoration
                          child: Row(
                            children: [
                              Expanded(//display grade
                                flex: 6,
                                child: Text(
                                  '   ' + userData['grade'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),//TextStyle
                                ),//Text
                              ),//Expanded
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.numbers,
                                  size: 30,
                                ),//Icon
                              ),//Expanded
                            ],
                          ),
                        ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: (300/androidWidth)*width,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: Colors.black)),//BoxDecortaion
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        //display name
                                        '   ' + userData['parentname'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),//TextStyle
                                      ),//Text
                                    ),//Expanded
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.abc,
                                        size: 30,
                                      ),//Icon
                                    ),//ecpanded
                                  ],//Row
                                ),
                              ),//Container
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: (300/androidWidth)*width,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: Colors.black)),//BorderDecoration
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        '   ' + userData['parentcontact'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),//TexStyle
                                      ),//Text
                                    ),//Expanded
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.phone,
                                        size: 30,
                                      ),//Icon
                                    ),//Expanded
                                  ],
                                ),//Row
                              ),
                            ],
                          ),
                        ),//Container
                      ],
                    ),//Column
                  ),//Center
                ]),//Stack
              ),//SingleChildScrollView
            );//Center
            //Check for errors
          } else if (snapshot.hasError) {
            return Center(child: Text(('Error' + snapshot.error.toString())));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),//StreamBuilder
    );//Scaffold
  }
}
