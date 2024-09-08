import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart';
import 'package:flutter_application_test_3/views/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

 class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    double iPhone15_height = 932.0;

    return Scaffold(
      appBar: AppBar(),
      body: Container (
              color: Colors.white,
              padding: EdgeInsets.only(left:10.0, right:10.0),
              height: height,
      child:
        Column (
        children: [
          SizedBox(height: (35/iPhone15_height)*height),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton( // alert an adult button
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
            ],),
        
          SizedBox(height: (25.0/iPhone15_height)*height,),
   
   
          IconButton( // about bullying re-route button
            onPressed: () {
            Navigator.pushNamed(context, '/Profile');
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
            Navigator.pushNamed(context, '/Profile');
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
      drawer: Drawer(
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
            // ListTile(
            //   leading: Icon(Icons.exit_to_app),
            //   title: Text('D E L E T E'),
            //   onTap: () {
            //     FirebaseAuth.instance.currentUser!.delete();
            //       Navigator.pop(context);
            //       Navigator.pushNamed(context, '/PreView');
            //     },

            // ),
          ],
        ),
      ),
    );
  }
}