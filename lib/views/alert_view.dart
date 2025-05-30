// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertView extends StatefulWidget {
  const AlertView({super.key});
  
  
  @override
  State<AlertView> createState() => _AlertViewState();
  
}


// Function to get the user's current location and format it as a Google Maps URL
Future <String?> getUserLocation() async{
    try{
      final location = await Location().getLocation();
      final latitude = location.latitude;
      final longitude = location.longitude;
      // Construct a Google Maps URL with the user's latitude and longitude
      final googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
      print("Location URL: $googleMapsUrl"); // For debugging
      return googleMapsUrl;
    }
  catch(e){
    print('Error getting location: $e'); // Log any errors
    return null; // Return null if location cannot be obtained
  }
  }


class _AlertViewState extends State<AlertView> {
  
  final user = FirebaseAuth.instance.currentUser!; // Get the current authenticated user

  // State variable to toggle between SMS and Call option
  bool _isSmsSelected = true; // true for SMS, false for Call

  @override
  void initState(){
    super.initState();
  }
  
  
  List<String> docIds = []; // List to store document IDs from Firestore (currently unused in UI)
    Future getDocId() async {
    await FirebaseFirestore.instance.collection('Users').get().then(
    (snapshot)=>snapshot.docs.forEach((element){
      print(element.reference);
      docIds.add(element.reference.id);
    }));
  }
  
  @override
  Widget build(BuildContext context) {     
    final Size screenSize = MediaQuery.of(context).size; // Get screen size for responsive design
    final double height = screenSize.height;
    final double width = screenSize.width;
    // Define reference dimensions for scaling UI elements
    double androidHeight = 800.0; 
    double androidWidth = 360.0;

    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true, // Extend body behind the app bar
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent, // Transparent app bar
          foregroundColor: Colors.white, // White foreground for text/icons
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          actions: [
            // Row to display both SMS and Call options
            Container(
              margin: EdgeInsets.only(right: 10), // Add some margin from the right edge
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3), // Semi-transparent background for the toggle
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // SMS Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSmsSelected = true;
                      });
                      // Removed SnackBar for mode change
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: _isSmsSelected ? Colors.white : Colors.transparent, // Highlight if selected
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'SMS',
                        style: TextStyle(
                          color: _isSmsSelected ? Colors.black : Colors.white, // Text color based on selection
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5), // Small space between buttons
                  // Call Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSmsSelected = false;
                      });
                      // Removed SnackBar for mode change
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: !_isSmsSelected ? Colors.white : Colors.transparent, // Highlight if selected
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Call',
                        style: TextStyle(
                          color: !_isSmsSelected ? Colors.black : Colors.white, // Text color based on selection
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
          // Stream to listen for real-time updates to the current user's document in Firestore
          stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
            // Extract user data from the snapshot
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final String _phoneNumber = userData['parentcontact']; // Get parent's contact number
            final String _username = userData['username']; // Get username (currently unused in UI)
            return Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      // Background image for the top section
                      Image.asset("lib/images/Rectangle 19.png"),
                      
                      Center(
                        child: Column(
                        children: [
                          SizedBox(
                            height: (110/androidHeight)*height, // Responsive spacing
                          ),
                          // Image for visual appeal
                          Image.asset("lib/images/image 2.png"),
                          SizedBox(
                            height: (40/androidHeight)*height, // Responsive spacing
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
                            children: [
                              SizedBox(
                                width: (20/androidWidth)*width // Responsive spacing
                              ),
                              // Parent button
                              Container(
                                height: (60/androidHeight)*height, // Responsive height
                                width: (150/androidWidth)*width, // Responsive width
                                decoration: BoxDecoration(
                                    color : Color.fromRGBO(179, 25, 22, 1), // Red background
                                    borderRadius: BorderRadius.circular(20), // Rounded corners
                                    border :Border.all(color : Colors.black) // Black border
                                  ),
                                child: TextButton(
                                  onPressed: () async{
                                    try {
                                      if (_isSmsSelected) {
                                        // SMS mode
                                        final locationUrl = await getUserLocation();
                                        if (locationUrl != null) {
                                          launch('sms:$_phoneNumber?body=I am in distress and require immediate assistance. This is my location: $locationUrl');
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Could not get your current location. Please ensure location services are enabled.')),
                                          );
                                        }
                                      } else {
                                        // Phone Call mode
                                        launch('tel:$_phoneNumber');
                                      }
                                    } catch (e) {
                                      print('Error launching: $e'); // Log any errors
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Failed to launch. Please try again.')),
                                      );
                                    }
                                  }, 
                                  child: Text(
                                    'Parent',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color.fromRGBO(255, 255, 255, 1)), // White text
                                    textAlign: TextAlign.left,
                                  )
                                ),
                              ),
                              SizedBox(
                                width: (20/androidWidth)*width, // Responsive spacing
                              ),
                              // Teacher button (similar logic to Parent button)
                              Container(
                                height: (60/androidHeight)*height, // Responsive height
                                width: (150/androidWidth)*width, // Responsive width
                                
                                decoration: BoxDecoration(
                                    color : Color.fromRGBO(179, 25, 22, 1), // Red background
                                    borderRadius: BorderRadius.circular(20), // Rounded corners
                                    border :Border.all(color : Colors.black) // Black border
                                  ),
                                child: TextButton(
                                  onPressed: ()async{
                                    try {
                                      if (_isSmsSelected) {
                                        // SMS mode
                                        final locationUrl = await getUserLocation();
                                        if (locationUrl != null) {
                                          launch('sms:$_phoneNumber?body=I am in distress and require immediate assistance. This is my location: $locationUrl');
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Could not get your current location. Please ensure location services are enabled.')),
                                          );
                                        }
                                      } else {
                                        // Phone Call mode
                                        launch('tel:$_phoneNumber');
                                      }
                                    } catch (e) {
                                      print('Error launching: $e');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Failed to launch. Please try again.')),
                                      );
                                    }
                                  }, 
                                  child: Text(
                                    'Teacher',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color.fromRGBO(255, 255, 255, 1)), // White text
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
                SizedBox(height: (40/androidHeight)*height), // Responsive spacing
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Alert a teacher or a parent if you\'re in distress or need help',
                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                    textAlign: TextAlign.center,
                                    ),
                ),
                // This text will now change based on the selected mode
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _isSmsSelected
                        ? 'An SMS will be sent to this number to alert them that you are in need of assistance.'
                        : 'A phone call will be initiated to this number to alert them that you are in need of assistance.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: (20/androidHeight)*height,),
                Container(
                  width: (200/androidWidth)*width,
                  height: (30/androidHeight)*height,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color : Colors.black),
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                  child: Center( // Center the text within the container
                    child: Text('$_phoneNumber', // Display the parent's phone number
                        style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
            }
            else if(snapshot.hasError){
                return Center(child: Text(('Error'+snapshot.error.toString())));
              }
              else{
                return const Center(child: CircularProgressIndicator()); // Show loading indicator
              }
          }
        )
    );
  }
}
