import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 
 
 class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    // setting sizes so can be adjusted based on phone size
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    double iPhone15_height = 932.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
      ),
      body:StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          return Stack(
            
            children: [
              Image.asset("lib/images/Android Large - 11.png"), // background colour
              Container (
                      
                      padding: EdgeInsets.only(left:10.0, right:10.0),
                      height: height,
              child:
                Column (
                children: [
                  SizedBox(height: (120/iPhone15_height)*height),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Visibility(
                      visible : userData['isStudent'],
                      child: IconButton( // alert an adult button
                      onPressed: () {
                      Navigator.pushNamed(context, '/AlertView');
                      },
                      
                      
                                          
                      icon:
                        Image.asset( // place image as the child of the container
                          'lib/images/alert_button.png', // access image from assets folder
                          width: (228.0/48.0)*((48.0/iPhone15_height)*height),
                          height: (48.0/iPhone15_height)*height,
                          fit: BoxFit.cover, // contain image
                        ),
                                   
                                   
                                    ),
                    ),
          
                  Visibility(
                    visible : userData['isAdmin'],
                    child: IconButton( // alert an adult button
                      onPressed: () {
                      Navigator.pushNamed(context, '/FormView');
                      },
                              
                      
                                          
                      icon:
                        Image.asset( // place image as the child of the container
                          'lib/images/SubmittedForms.png', // access image from assets folder
                          width: (228.0/48.0)*((48.0/iPhone15_height)*height),
                          height: (48.0/iPhone15_height)*height,
                          fit: BoxFit.cover, // contain image
                        ),
                                     
                                     
                    ),
                  ),
                    ],),
                
                  SizedBox(height: (25.0/iPhone15_height)*height,),
                 
                 
                  IconButton( // about bullying re-route button
                    onPressed: () {
                    Navigator.pushNamed(context, '/AboutBullying');
                    },
                                        
                    icon:
                      Image.asset( // place image as the child of the container
                        'lib/images/about_bullying.png', // access image from assets folder
                        width: (380.0/200.0)*((200.0/iPhone15_height)*height),
                        height: (200.0/iPhone15_height)*height,
                        fit: BoxFit.cover, // contain image
                      ),
                 
                 
                  ),
                 
                 
                  SizedBox(height: (20.0/iPhone15_height)*height),
                 
                 
                  IconButton( // reporting form re-route button
                    onPressed: () {
                    Navigator.pushNamed(context, '/ReportingFormView');
                  
                    },
                                        
                    icon:
                      Image.asset( // place image as the child of the container
                        'lib/images/reporting_form.png', // access image from assets folder
                        width: (380.0/200.0)*((200.0/iPhone15_height)*height),
                        height: (200.0/iPhone15_height)*height,
                        fit: BoxFit.cover, // contain image
                      ),
                 
                 
                  ),
                 
                 
                  SizedBox(height: (20.0/iPhone15_height)*height),
                 
                 
                  IconButton( // anti-bullying squad re-route button
                    onPressed: () {
                    Navigator.pushNamed(context, '/AntibullyingSquadView');
                    },
                                        
                    icon:
                      Image.asset( // place image as the child of the container
                        'lib/images/antibullying_squad.png', // access image from assets folder
                        width: (380.0/200.0)*((200.0/iPhone15_height)*height),
                        height: (200.0/iPhone15_height)*height,
                        fit: BoxFit.cover, // contain image
                      ),
                 
                 
                  ),
                                      
                 
                 
              ],),
              
              ),
            ],
          );
          
        }
        else if (snapshot.hasError) {
            return Center(child: Text(('Error' + snapshot.error.toString())));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
      drawer: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          return Drawer(
            
            child: Column(
              children: [
                DrawerHeader(
                  child: Image.asset("lib/images/Aditya Birla Logo.png"),
                  ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('H O M E'),
                  onTap: (){
                    Navigator.pushNamed(context, '/MainPage');
                  },
                  
          
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('P R O F I L E'),
                  onTap: (){
                    Navigator.pushNamed(context, '/Profile');
                  },
          
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('L O G O U T'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/PreView');
                    },
          
                ),
                 
              ],
            ),
          );
        }
        else if (snapshot.hasError) {
            return Center(child: Text(('Error' + snapshot.error.toString())));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}