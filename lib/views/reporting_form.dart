//  import 'package:flutter/material.dart';
//  import 'package:provider/provider.dart';
//  import 'package:flutter_screenutil/flutter_screenutil.dart';

//  void main() {
//   runApp(MyApp()); // main function to run the app
//  }
//  class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) { // specify details about app
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'BullyApp',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
//         ),
//         home: HomePage(),
//       ),
//     );
//   }
//  }
//  class MyAppState extends ChangeNotifier { // create app state for values that are constantly changing
//   var type = ""; // default type is set to nothing
//   var location = ""; // default location is set to nothing
//   // create booleans for all buttons so colour can be changed when the button is pressed
//   bool onlinePressed = false;
//   bool offlinePressed = false;
//   bool inSchoolPressed = false;
//   bool outsideSchoolPressed = false;
//   bool onTheBusPressed = false;
//   bool instagramPressed = false;
//   bool snapchatPressed = false;
//   bool whatsappPressed = false;
//   bool gamesPressed = false;
//   bool otherPressed = false;
//   DateTime? date = DateTime.now();
//   bool dateChosen = false;
//   TimeOfDay? time = TimeOfDay.now();
//   bool timeChosen = false;
//   int page = 1 ;
//   String name_of_victim = '';
//   String name_of_victim2 = '';
//   String name_of_victim3 = '';
//    String name_of_bully = '';
//   String name_of_bully2 = '';
//   String name_of_bully3 = '';
//   String get nameOfVictim => name_of_victim;
//   String get nameOfBully => name_of_bully;
//   int victims = 1;
//   int bullies = 1;
//   //List <File> images = [];
//   String details = '';


//    // Variable to store the text field value
//   //FIREBASE_TOKEN = 1//0g-Ahk24QnHkuCgYIARAAGBASNwF-L9IrkJkHCwr2WIHPffm4TryaevQ2_ZmLc0TzMtO6ff6h6G9UfcvBOW58G1YxjI_542uzB24
//   void typeOnline() { // carried out when button is clicked
//     type = "online"; // sets type to online
//     onlinePressed = !onlinePressed; // presses the button if not pressed and unpresses if pressed
//     offlinePressed = false; // unpresses other button
    
//   }
//    void typeOffline() { // carried out when button is clicked
//     type = "offline"; // sets type to offline
//     offlinePressed = !offlinePressed; // presses the button if not pressed and unpresses if pressed
//     onlinePressed = false; // unpresses other button
    
//   }
//   void inSchool() {  // carried out when button is clicked
//     location = "In School"; // sets location to in school
//     inSchoolPressed = !inSchoolPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     outsideSchoolPressed = false;
//     onTheBusPressed = false;
    
//   }
//   void onTheBus() { // carried out when button is clicked
//     location = "On the bus"; // sets location to on the bus
//     onTheBusPressed = !onTheBusPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     outsideSchoolPressed = false;
//     inSchoolPressed = false;
    
//   }
//   void outsideSchool() { // carried out when button is clicked
//     location = "Outside School"; // sets location to outside school
//     outsideSchoolPressed = !outsideSchoolPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     inSchoolPressed = false;
//     onTheBusPressed = false;
    
//   }
//   void instagram() { // carried out when button is clicked
//     location = "Instagram"; // sets location to instagram
//     instagramPressed = !instagramPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     snapchatPressed = false;
//     whatsappPressed = false;
//     gamesPressed = false;
//     otherPressed = false;
    
//   }
//   void snapchat() { // carried out when button is clicked
//     location = "Snapchat"; // sets location to snapchat
//     snapchatPressed = !snapchatPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     whatsappPressed = false;
//     instagramPressed = false;
//     gamesPressed = false;
//     otherPressed = false;
    
//   }
//   void whatsapp() { // carried out when button is clicked
//     location = "Whatsapp"; // sets location to whatsapp
//     whatsappPressed = !whatsappPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     snapchatPressed = false;
//     instagramPressed = false;
//     gamesPressed = false;
//     otherPressed = false;
    
//   }
//   void games() { // carried out when button is clicked
//     location = "Games"; // sets location to games
//     gamesPressed = !gamesPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     snapchatPressed = false;
//     instagramPressed = false;
//     whatsappPressed = false;
//     otherPressed = false;
    
//   }
//   void other() { // carried out when button is clicked
//     location = "Games"; // sets location to other
//     otherPressed = !otherPressed; // presses the button if not pressed and unpresses if pressed
//     // unpresses other buttons
//     snapchatPressed = false;
//     instagramPressed = false;
//     whatsappPressed = false;
//     gamesPressed = false;
    
//   }
//   void date_picker(BuildContext context) {
//     showDatePicker (
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime.now(),
//       ).then((value) {
//        date = value;
//        dateChosen = true;
       
//       }
//   );
//   }
//   void time_picker(BuildContext context) {
//     showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now()
//       ).then((value) {
//         time = value;
//         timeChosen = true;
        
//       });
//   }
//    void nameOfVictimChosen(String name) {
//      if (victims == 1) {
//        name_of_victim = name;
//      }
//      else if (victims == 2) {
//        name_of_victim2 = name;
//      }
//      else if (victims == 3) {
//        name_of_victim3 = name;
//      }
     
//   }
//   void addAVictim() {
//    victims = victims + 1;
   
//   }
//   void removeAVictim() {
//    victims = victims - 1;
   
//   }
//   void nameOfBullyChosen(String name) {
//      if (bullies == 1) {
//        name_of_bully = name;
//      }
//      else if (bullies == 2) {
//        name_of_bully2 = name;
//      }
//      else if (bullies == 3) {
//        name_of_bully3 = name;
//      }
     
//   }
//   void addABully() {
//    bullies = bullies + 1;
   
//   }
//   void removeABully() {
//    bullies = bullies - 1;
   
//   }
//   void changePage() {
//    page = page;
   
//   }
//   /*void image_picker() {
//    final picker = ImagePicker();
//    picker.pickImage(source: ImageSource.gallery).then((pickedFile) {
//        if (pickedFile != null) {
//          images.add(File(pickedFile.path));
         
//        }
//      }).catchError((error) {
//        print('There was an error: );
//      }); 
//   } */
//   void detailsGiven(String text) {
//      details = text;
     
//   }
//   }
//  class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    var appState = context.watch<MyAppState>();
//     final Size screenSize = MediaQuery.of(context).size;
//     final double height = screenSize.height;
//     double iPhone15_height = 932.0;
//    return ScreenUtilInit(
//     designSize: Size(430,932),
//     builder:(context, child) {
//     return Container(
//        color: Colors.white,
//        padding: EdgeInsets.only(left:10.0, right:10.0),
//        child:
//          Column (
//          children: [
//            SizedBox(height: (58/iPhone15_height)*height),
      
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: [
//                IconButton( // alert an adult button
//              onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => Alert_an_adult()),
//                );
//              },
                              
//              icon:
//                Image.asset( // place image as the child of the container
//                  'assets/alert_button.png', // access image from assets folder
//                  width: (228.0/48.0)*((48.0/iPhone15_height)*height),
//                  height: (48.0/iPhone15_height)*height,
//                  fit: BoxFit.cover, // contain image
//                ),
 
 
//            ),
//              ],),
      
//            SizedBox(height: (25.0/iPhone15_height)*height,),
 
 
//            IconButton( // about bullying re-route button
//              onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => About_Bullying()),
//                );
//              },
                              
//              icon:
//                Image.asset( // place image as the child of the container
//                  'assets/about_bullying.png', // access image from assets folder
//                  width: (380.0/200.0)*((200.0/iPhone15_height)*height),
//                  height: (200.0/iPhone15_height)*height,
//                  fit: BoxFit.cover, // contain image
//                ),
 
 
//            ),
 
 
//            SizedBox(height: (20.0/iPhone15_height)*height),
 
 
//            IconButton( // reporting form re-route button
//              onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => ReportingForm()),
//                );
//              page = 1;
//              },
                              
//              icon:
//                Image.asset( // place image as the child of the container
//                  'assets/reporting_form.png', // access image from assets folder
//                  width: (380.0/200.0)*((200.0/iPhone15_height)*height),
//                  height: (200.0/iPhone15_height)*height,
//                  fit: BoxFit.cover, // contain image
//                ),
 
 
//            ),
 
 
//            SizedBox(height: (20.0/iPhone15_height)*height),
 
 
//            IconButton( // anti-bullying squad re-route button
//              onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => AntiBullying_Squad()),
//                );
//              },
                              
//              icon:
//                Image.asset( // place image as the child of the container
//                  'assets/antibullying_squad.png', // access image from assets folder
//                  width: (380.0/200.0)*((200.0/iPhone15_height)*height),
//                  height: (200.0/iPhone15_height)*height,
//                  fit: BoxFit.cover, // contain image
//                ),
 
 
//            ),
                            
 
 
//        ],),
//        );
//        },
//    );
//  }
//   }
//  class About_Bullying extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
  
//     return Column (
//       children:[
//         Text("ABOUT BULLYING INFO HERE")
//       ]
//     );
//   } }
//  class ReportingForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//      return ScreenUtilInit(
//      designSize: Size(430,932),
//      builder:(context, child) {
//      const defaultTextStyle = TextStyle( // creates a default text style
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//       fontFamily: 'Open Sans',
//       letterSpacing: 0.5,
//       fontSize: 20,
//       height: 2,
//       decoration: TextDecoration.none,
  
//     );
//     const titleTextStyle = TextStyle( // creates a title text style
//       color: Colors.white,
//       fontWeight: FontWeight.w800,
//       fontFamily: 'Open Sans',
//       letterSpacing: 0.5,
//       fontSize: 28,
//       height: 2,
//       decoration: TextDecoration.none,
  
//     );
//      const bigButtonTextStyle = TextStyle( // creates a title text style
//       color: Colors.white,
//       fontWeight: FontWeight.w600,
//       fontFamily: 'Open Sans',
//       letterSpacing: 0.5,
//       fontSize: 24,
//       height: 2,
//       decoration: TextDecoration.none,
  
//     );
//     const buttonTextStyle = TextStyle( // creates a title text style
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//       fontFamily: 'Open Sans',
//       letterSpacing: 0.5,
//       fontSize: 16,
//       height: 2,
//       decoration: TextDecoration.none,
  
//     );
//     final Size screenSize = MediaQuery.of(context).size;
//     final double height = screenSize.height;
//     double topPadding = MediaQuery.of(context).padding.top;
 
//      return Scaffold(
//        body: DefaultTextStyle.merge( // applies default text style to everything
//          style: defaultTextStyle.copyWith(
//            fontSize: 20.0.sp,
//           ),
//          child:
//              Column(
//                children: [
//                // page 1
//                 Visibility(
//                   visible: page == 1,
//                   child:
//                     Container(
//                      height: height,
//                      color: Color(0xFFEB7C10),
//                      padding: EdgeInsets.all(10.0.sp),
//                       child:
//                         Column ( // creates a column for the data in the page
//                           children: [
//                             Container( // creates a container for the title text
//                                 alignment: Alignment.centerLeft,
//                                 padding: EdgeInsets.only(top: topPadding, bottom: 0.0.sp, left: 10.0.sp, right: 10.0.sp),
//                                 child:
//                                 Text(
//                                 'Reporting Form',
//                                 style: titleTextStyle.copyWith(
//                                  fontSize: 28.0.sp,
//                                 ), // changes default style to title text
//                               ),
//                               ),
     
     
//                             Container( // creates a container for the subtitle text
//                                 alignment: Alignment.centerLeft,
//                                 padding: EdgeInsets.only(top: 0.0, bottom: 20.0.sp, left: 10.0.sp, right: 10.0.sp),
//                                 child:
//                                 Text(
//                                 'Speak out about instances of bullying that you or someone around you has experienced.',
//                                 style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400)
//                               ),
//                               ),
     
     
//                             Container ( // creates a line
//                               width: 9000.0,
//                               height: 2.0.sp,
//                               color: Colors.white,
//                               padding: EdgeInsets.all(0.0),
//                             ),
     
     
//                             Column( // creates a column for the questions which need to be center aligned
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(height: 10.0.sp),
                            
//                                 Container(
//                                   alignment: Alignment.centerLeft,
//                                   padding: EdgeInsets.all(10.0.sp),
//                                   child: Text(
//                                   'Which category of bullying is this?',
//                                 ),
//                                 ),
     
     
//                                 Row( // creates a row for all 3 buttons
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
                                
//                                     SizedBox(
//                                       width: 190.sp,
//                                       height: 60.0.sp,
//                                       child:
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             typeOffline();
//                                           },
//                                           style: ElevatedButton.styleFrom (
//                                             backgroundColor: offlinePressed ?  Color(0xFFF2BE0F): const Color(0xFFEB7C10) ,
//                                                 foregroundColor: Colors.white,
//                                                 side: BorderSide(color: Colors.white, width: 2.0.sp),
//                                             ),
//                                           child: Text('In-Person',
//                                           style: bigButtonTextStyle.copyWith(
//                                            fontSize: 24.0.sp,
//                                 ), // changes default style to title text
//                                           ),
//                                         ),
//                                     ),
     
     
//                                     SizedBox(
//                                       width: 170.sp,
//                                       height: 60.0.sp,
//                                       child:
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             typeOnline();
//                                           },
//                                           style: ElevatedButton.styleFrom (
//                                             backgroundColor: onlinePressed ?  Color(0xFFF2BE0F): const Color(0xFFEB7C10) ,
//                                                 foregroundColor: Colors.white,
//                                                 side: BorderSide(color: Colors.white, width: 2.0.sp),
//                                             ),
//                                           child:  Text('Online',
//                                           style: bigButtonTextStyle.copyWith(
//                                            fontSize: 24.0.sp,
//                                            ),
                                    
//                                           ),
//                                         ),
//                                     ),
                                
//                                   ],
//                                 ),
                            
//                                 SizedBox(height: 30.0.sp),
     
     
//                                 Visibility( // creates a visibility widget for the second question if offline
//                                   visible: !onlinePressed,
//                                   child:
//                                     Column (
//                                       children: [ // creates a column to store multiple visibility widgets
//                                         Container( // creates a container for the text
//                                         alignment: Alignment.centerLeft,
//                                         padding: EdgeInsets.all(10.0.sp),
//                                         child: Text(
//                                         'Where did the incident happen?',
//                                         ),
//                                         ),
                                    
//                                         Row( // creates a row for the 3 buttons
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           SizedBox(
//                                             width: 128.0.sp,
//                                             height: 60.0.sp,
//                                             child:
//                                               ElevatedButton(
//                                               onPressed: () {
//                                                 inSchool();
//                                               },
//                                               style: ElevatedButton.styleFrom (
//                                                 backgroundColor: inSchoolPressed ?  Color(0xFFF2BE0F): const Color(0xFFEB7C10) ,
//                                                 foregroundColor: Colors.white,
//                                                 side: BorderSide(color: Colors.white, width: 2.0.sp),
//                                                 ),
//                                               child: Text('In School',
//                                               style: buttonTextStyle.copyWith(
//                                                fontSize: 15.0.sp,
//                                               ),
//                                               ),
//                                             ),
//                                             ),
                                      
//                                           SizedBox(width:10.0.sp),
     
     
//                                           SizedBox(
//                                             width: 140.0.sp,
//                                             height: 60.0.sp,
//                                             child:
//                                             ElevatedButton(
//                                               onPressed: () {
//                                                 onTheBus();
//                                               },
//                                               style: ElevatedButton.styleFrom (
//                                                 backgroundColor: onTheBusPressed ?  Color(0xFFF2BE0F): const Color(0xFFEB7C10) ,
//                                                 foregroundColor: Colors.white,
//                                                 side: BorderSide(color: Colors.white, width: 2.0.sp),
//                                                 ),
//                                               child: Text('On the bus',
//                                               style: buttonTextStyle.copyWith(
//                                                fontSize: 15.0.sp,
//                                               ),
//                                               ),
//                                             ),
//                                           ),
     
     
//                                           SizedBox(width:10.0.sp),
     
     
//                                           SizedBox(
//                                             width: 116.0.sp,
//                                             height: 60.0.sp,
//                                             child:
//                                               ElevatedButton(
//                                                 onPressed: () {
//                                                   outsideSchool();
//                                                 },
//                                                 style: ElevatedButton.styleFrom (
//                                                   backgroundColor: outsideSchoolPressed ?  Color(0xFFF2BE0F): const Color(0xFFEB7C10) ,
//                                                   foregroundColor: Colors.white,
//                                                   side: BorderSide(color: Colors.white, width: 2.0.sp),
//                                                   ),
//                                                 child: Text('Outside',
//                                                 style: buttonTextStyle.copyWith(
//                                                fontSize: 15.0.sp,
//                                               ),
//                                                 ),
//                                               ),
//                                           ),
     
     
//                                       ],),
                                
//                                     ],),
//                                     ),
     
     
//                                 Visibility( // creates a visibility widget for the second question if online
//                                   visible: onlinePressed,
//                                   child:
//                                     Column (
//                                       children: [ // creates a column to store multiple visibility widgets
//                                         Container( // creates a container to store text
//                                           alignment: Alignment.centerLeft,
//                                           padding: EdgeInsets.all(10.0.sp),
//                                           child: Text(
//                                           'Where did the incident happen?',
//                                         ),
//                                         ),
     
     
//                                         Row( // creates a row for the buttons
//                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                           children: [
                                        
//                                           IconButton( // icon button 1 - instagram
//                                             onPressed: () {
//                                               instagram(); // when pressed, carry out instagram function
//                                             },
     
     
//                                             icon:
//                                             Container( // place icon in a container so border can be added
//                                               width: 65.0.sp, // width = width of image + border
//                                               height: 65.0.sp, // height = height of image + border
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(  // constant border throughout
//                                                   color: instagramPressed ? Colors.white: Colors.transparent, // when pressed, border becomes visible and white
//                                                   width: 3.0.sp,
//                                                 ),
//                                                 borderRadius: BorderRadius.circular(12.0), // most apps are rounded squares
//                                               ),
                                          
//                                               child:
//                                                 Image.asset( // place image as the child of the container
//                                                 'assets/instagram_logo.png', // access image from assets folder
//                                                 width: 50.0.sp,
//                                                 height: 50.0.sp, 
//                                                 fit: BoxFit.contain, // contain image
//                                               ), 
     
     
//                                             ),
//                                           ),
     
     
//                                           IconButton( // icon button 2 - snapchat
//                                             onPressed: () {
//                                               snapchat(); // when pressed, carry out snapchat function
//                                             },
                                        
//                                             icon:
//                                             Container( // place icon in a container so border can be added
//                                               width: 65.0.sp, // width = width of image + border
//                                               height: 65.0.sp, // height = height of image + border
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(  // constant border throughout
//                                                   color: snapchatPressed ? Colors.white: Colors.transparent, // when pressed, border becomes visible and white
//                                                   width: 3.0.sp,
//                                                 ),
//                                                 borderRadius: BorderRadius.circular(16.0), // most apps are rounded squares
//                                               ),
                                          
//                                               child:
//                                                 Image.asset( // place image as the child of the container
//                                                 'assets/snapchat_logo.png', // access image from assets folder
//                                                 width: 60.0.sp,
//                                                 height: 60.0.sp, 
//                                                 fit: BoxFit.contain, // contain image
//                                               ),
     
     
//                                             ),
//                                           ),
     
     
//                                           IconButton( // icon button 3 - whatsapp
//                                             onPressed: () {
//                                               whatsapp(); // when pressed, carry out whatsapp function
//                                             },
                                        
//                                             icon:
//                                             Container( // place icon in a container so border can be added
//                                               width: 65.0.sp, // width = width of image + border
//                                               height: 65.0.sp, // height = height of image + border
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(  // constant border throughout
//                                                   color: whatsappPressed ? Colors.white: Colors.transparent, // when pressed, border becomes visible and white
//                                                   width: 3.0.sp,
//                                                 ),
//                                                 borderRadius: BorderRadius.circular(16.0), // most apps are rounded squares
//                                               ),
                                          
//                                               child:
//                                                 Image.asset( // place image as the child of the container
//                                                 'assets/whatsapp_logo.png', // access image from assets folder
//                                                  width: 50.0.sp,
//                                                  height: 50.0.sp, 
//                                                 fit: BoxFit.contain, // contain image
//                                               ), 
     
     
//                                             ),
//                                           ),
                                      
//                                           IconButton( // icon button 4 - games (refers to any kind of online games)
//                                             onPressed: () {
//                                               games(); // when pressed, carry out games function
//                                             },
                                        
//                                             icon:
//                                             Container( // place icon in a container so border can be added
//                                               width: 65.0.sp, // width = width of image + border
//                                               height: 65.0.sp, // height = height of image + border
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(  // constant border throughout
//                                                   color: gamesPressed ? Colors.white: Colors.transparent, // when pressed, border becomes visible and white
//                                                   width: 3.0,
//                                                 ),
//                                                 borderRadius: BorderRadius.circular(16.0), // most apps are rounded squares
//                                               ),
                                          
//                                               child:
//                                                 Image.asset( // place image as the child of the container
//                                                 'assets/games_logo.png', // access image from assets folder
//                                                 width: 50.0.sp,
//                                                 height: 50.0.sp, 
//                                                 fit: BoxFit.contain, // contain image
//                                               ), 
     
     
//                                             ),
//                                           ),
     
     
//                                           IconButton( // icon button 5 - other
//                                             onPressed: () {
//                                               other(); // when pressed, carry out other function
//                                             },
                                        
//                                             icon:
//                                             Container( // place icon in a container so border can be added
//                                               width: 65.0.sp, // width = width of image + border
//                                               height: 65.0.sp, // height = height of image + border
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(  // constant border throughout
//                                                   color: otherPressed ? Colors.white: Colors.transparent, // when pressed, border becomes visible and white
//                                                   width: 3.0,
//                                                 ),
//                                                 borderRadius: BorderRadius.circular(16.0), // most apps are rounded squares
//                                               ),
                                          
//                                               child:
//                                                 Image.asset( // place image as the child of the container
//                                                 'assets/other_logo.png', // access image from assets folder
//                                                 width: 50.0.sp,
//                                                 height: 50.0.sp, 
//                                                 fit: BoxFit.contain, // contain image
//                                               ),
     
     
//                                             ),
//                                           ),
     
     
//                                         ],),
//                                     ],),
//                                     ),
     
     
//                                   SizedBox(height: 30.0.sp),
     
     
//                                   Container( // creates a container to store text
//                                           alignment: Alignment.centerLeft,
//                                           padding: EdgeInsets.all(10.0.sp),
//                                           child: Text(
//                                           'When did the incident happen?',
//                                         ),
//                                         ),
     
     
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       ElevatedButton(
//                                         onPressed: () => date_picker(context),
//                                         style: ElevatedButton.styleFrom (
//                                           backgroundColor: dateChosen ?  Color(0xFFF2BE0F): const Color(0xFFEB7C10),
//                                           foregroundColor: Colors.white,
//                                           side: BorderSide(color: Colors.white, width: 2.0),
//                                           ),
//                                           child:  Text('Date',
//                                           style: bigButtonTextStyle.copyWith(
//                                            fontSize: 24.0.sp,
//                                 ),
//                                           ),
//                                       ),
                                  
//                                       ElevatedButton(
//                                         onPressed: () => time_picker(context),
//                                         style: ElevatedButton.styleFrom (
//                                           backgroundColor: timeChosen ?  Color(0xFFF2BE0F): const Color(0xFFEB7C10),
//                                           foregroundColor: Colors.white,
//                                           side: BorderSide(color: Colors.white, width: 2.0),
//                                           ),
//                                           child: Text('Time',
//                                           style: bigButtonTextStyle.copyWith(
//                                            fontSize: 24.0.sp,
//                                           ),
//                                           ),
//                                       ),
//                                     ],
//                                   ),
    
//                             ],),
//                       Spacer(),
//                       Row( // creates a row for the buttons
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: [
                                        
//                                IconButton( // icon button 1 - home
//                                  onPressed: () { // takes you to home page
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/home.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
    
//                                IconButton( // icon button 1 - back
//                                  onPressed: () { // takes you to home page
//                                    page = page - 1;
//                                    if (page < 1) {
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    } else if (page == 2) {
//                                      changePage();
//                                    } 
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/back.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
//                                IconButton( // icon button 1 - home
//                                  onPressed: () { // takes you to home page
//                                    page = page + 1;
//                                    if (page > 3) {
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    } else {
//                                      changePage();
//                                    }
                                
                                
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/next.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
                            
     
//                                         ],),
//                                SizedBox(height: 20.0.sp),
//                                         ],),
//                       ),
                   
//                  ),
              
//                  // page 2
//                  Visibility(
//                    visible: page == 2,
//                    maintainSize: false,
//                    child:
//                    Container(
//                      color: Color(0xFFEB7C10),
//                      padding: EdgeInsets.all(10.0.sp),
//                      height: height,
                   
//                      child:
//                          Column (
//                            children: [
//                              Container( // creates a container for the title text
//                                  alignment: Alignment.centerLeft,
//                                  padding: EdgeInsets.only(top: topPadding, bottom: 0.0.sp, left: 10.0.sp, right: 10.0.sp),
//                                  child:
//                                  Text(
//                                   'Reporting Form',
//                                   style: titleTextStyle.copyWith(
//                                    fontSize: 28.0.sp,
//                                  ),
//                                     // changes default style to title text
//                                 ),
//                                 ),
               
//                            Container( // creates a container for the subtitle text
//                                  alignment: Alignment.centerLeft,
//                                  padding: EdgeInsets.only(top: 0.0, bottom: 20.0.sp, left: 10.0.sp, right: 10.0.sp),
//                                  child:
//                                  Text(
//                                   'Tell us about the people involved...',
//                                   style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400)
//                                 ),
//                                 ),
               
               
//                            Container ( // creates a line
//                                width: 9000.0,
//                                height: 2.0,
//                                color: Colors.white,
//                                padding: EdgeInsets.all(0.0),
//                            ),
                        
//                          SizedBox(height:30.0.sp),

//                          Row(
//                            children: [
                        
//                              Align(
//                                alignment: Alignment.topLeft,
//                                child: SizedBox(
//                                  width: 300.0.sp,
//                                  height: 60.0.sp,
//                                  child: TextField(
//                                      onChanged: (text) {
//                                        nameOfVictimChosen(text);
//                                      },
//                                      decoration: InputDecoration(
//                                      labelText: 'Name of Victim',
//                                      border: OutlineInputBorder(),
//                                      fillColor: Colors.white,
//                                      )
//                                    ),
//                                ),
//                              ),
//                              IconButton(
//                                  onPressed: () {
//                                    if (victims < 4) {
//                                      addAVictim();
//                                    } 
//                                  }, 
//                                 icon: Image.asset( // place image as the child of the container
//                                        'assets/plus.png', // access image from assets folder
//                                        width: 60.0.sp,
//                                        height: 60.0.sp, 
//                                        fit: BoxFit.contain, // contain image      
//                                      ),
//                                ),
                       
//                            ],
//                          ),
                      
//                          SizedBox(height: 10.0.sp),
//                          Visibility(
//                            visible: (victims > 1),
//                            child: Row(
//                              children: [
//                                Align(
//                                  alignment: Alignment.topLeft,
//                                  child: SizedBox(
//                                      width: 300.0.sp,
//                                      height: 60.0.sp,
//                                      child: TextField(
//                                          onChanged: (text) {
//                                            nameOfVictimChosen(text);
//                                          },
//                                          decoration: InputDecoration(
//                                          labelText: 'Name of Victim 2',
//                                          border: OutlineInputBorder(),
//                                          fillColor: Colors.white,
//                                          )
//                                        ),
//                                    ),
//                                ),
                      
//                            IconButton(
//                                  onPressed: () {
//                                    if (victims > 1) {
//                                      removeAVictim();
//                                    } 
//                                  }, 
//                                 icon: Image.asset( // place image as the child of the container
//                                        'assets/minus.png', // access image from assets folder
//                                        width: 60.0.sp,
//                                        height: 60.0.sp, 
//                                        fit: BoxFit.contain, // contain image      
//                                      ),
//                                ),
//                                ],
//                            ),
//                          ),
//                          SizedBox(height: 10.0.sp),
//                          Visibility(
//                            visible: (victims > 2),
//                            child: Column(
//                              children: [
//                                Align(
//                                  alignment: Alignment.topLeft,
//                                  child: SizedBox(
//                                      width: 300.0.sp,
//                                      height: 60.0.sp,
//                                      child: TextField(
//                                          onChanged: (text) {
//                                            nameOfVictimChosen(text);
//                                          },
//                                          decoration: InputDecoration(
//                                          labelText: 'Name of Victim 3',
//                                          border: OutlineInputBorder(),
//                                          fillColor: Colors.white,
//                                          )
//                                        ),
//                                    ),
//                                ),
//                                Text ("If there are more victims, mention it in the additional details section later.",
//                                      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),)
//                              ],
//                            ),
                           
//                          ),
//                          Row(
//                            children: [
                        
//                              Align(
//                                alignment: Alignment.topLeft,
//                                child: SizedBox(
//                                  width: 300.0.sp,
//                                  height: 60.0.sp,
//                                  child: TextField(
//                                      onChanged: (text) {
//                                        nameOfBullyChosen(text);
//                                      },
//                                      decoration: InputDecoration(
//                                      labelText: 'Name of Bully',
//                                      border: OutlineInputBorder(),
//                                      fillColor: Colors.white,
//                                      )
//                                    ),
//                                ),
//                              ),
//                              IconButton(
//                                  onPressed: () {
//                                    if (bullies < 4) {
//                                      addABully();
//                                    } 
//                                  }, 
//                                 icon: Image.asset( // place image as the child of the container
//                                        'assets/plus.png', // access image from assets folder
//                                        width: 60.0.sp,
//                                        height: 60.0.sp, 
//                                        fit: BoxFit.contain, // contain image      
//                                      ),
//                                ),
                       
//                            ],
//                          ),
                      
//                          SizedBox(height: 10.0.sp),
//                          Visibility(
//                            visible: (bullies > 1),
//                            child: Row(
//                              children: [
//                                Align(
//                                  alignment: Alignment.topLeft,
//                                  child: SizedBox(
//                                      width: 300.0.sp,
//                                      height: 60.0.sp,
//                                      child: TextField(
//                                          onChanged: (text) {
//                                            nameOfBullyChosen(text);
//                                          },
//                                          decoration: InputDecoration(
//                                          labelText: 'Name of Bully 2',
//                                          border: OutlineInputBorder(),
//                                          fillColor: Colors.white,
//                                          )
//                                        ),
//                                    ),
//                                ),
                      
//                            IconButton(
//                                  onPressed: () {
//                                    if (bullies > 1) {
//                                      removeABully();
//                                    } 
//                                  }, 
//                                 icon: Image.asset( // place image as the child of the container
//                                        'assets/minus.png', // access image from assets folder
//                                        width: 60.0.sp,
//                                        height: 60.0.sp, 
//                                        fit: BoxFit.contain, // contain image      
//                                      ),
//                                ),
//                                ],
//                            ),
//                          ),
//                          SizedBox(height: 10.0.sp),
//                          Visibility(
//                            visible: (bullies > 2),
//                            child: Column(
//                              children: [
//                                Align(
//                                  alignment: Alignment.topLeft,
//                                  child: SizedBox(
//                                      width: 300.0.sp,
//                                      height: 60.0.sp,
//                                      child: TextField(
//                                          onChanged: (text) {
//                                            nameOfBullyChosen(text);
//                                          },
//                                          decoration: InputDecoration(
//                                          labelText: 'Name of Bully 3',
//                                          border: OutlineInputBorder(),
//                                          fillColor: Colors.white,
//                                          )
//                                        ),
//                                    ),
//                                ),
//                                Text ("If there are more bullies, mention it in the additional details section later.",
//                                      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),)
//                              ],
//                            ),
                           
//                          ),
//                          Spacer(),
//                          Row( // creates a row for the buttons
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: [
                                        
//                                IconButton( // icon button 1 - home
//                                  onPressed: () { // takes you to home page
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/home.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
    
//                                IconButton( // icon button 1 - back
//                                  onPressed: () { // takes you to home page
//                                    page = page - 1;
//                                    if (page < 1) {
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    } else if (page == 2) {
//                                      changePage();
//                                    } 
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/back.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
//                                IconButton( // icon button 1 - home
//                                  onPressed: () { // takes you to home page
//                                    page = page + 1;
//                                    if (page > 3) {
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    } else {
//                                      changePage();
//                                    }
                                
                                
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/next.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
     
//                                         ],),
//                                  SizedBox(height: 20.0.sp),
//                           ],)
//                     ),),
//                    // page 3
//                    Visibility(
//                      visible: page == 3,
//                      child: 
//                      Container(
//                        color: Color(0xFFEB7C10),
//                        padding: EdgeInsets.all(10.0.sp),
//                        height: height,
//                        child: Column(children: [
//                          Container( // creates a container for the title text
//                                   alignment: Alignment.centerLeft,
//                                   padding: EdgeInsets.only(top: topPadding, bottom: 0.0.sp, left: 10.0.sp, right: 10.0.sp),
//                                   child:
//                                   Text(
//                                   'Reporting Form',
//                                   style: titleTextStyle.copyWith(
//                                    fontSize: 28.0.sp,
//                                   ), // changes default style to title text
//                                 ),
//                                 ),
                           
                           
//                          Container( // creates a container for the subtitle text
//                                   alignment: Alignment.centerLeft,
//                                   padding: EdgeInsets.only(top: 0.0, bottom: 20.0.sp, left: 10.0.sp, right: 10.0.sp),
//                                   child:
//                                   Text(
//                                   "You're almost done...",
//                                   style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400)
//                                 ),
//                                 ),
                           
                           
//                          Container ( // creates a line
//                                 width: 9000.0,
//                                 height: 2.0.sp,
//                                 color: Colors.white,
//                                 padding: EdgeInsets.all(0.0),
//                               ),
//                          /*ElevatedButton(
//                                         onPressed: () {
//                                          image_picker();
//                                         },
//                                         style: ElevatedButton.styleFrom (
//                                           backgroundColor:  Color(0xFFF2BE0F),
//                                           foregroundColor: Colors.white,
//                                           side: BorderSide(color: Colors.white, width: 2.0),
//                                           ),
//                                           child:  Text('Upload a photo for proof',
//                                           style: bigButtonTextStyle.copyWith(
//                                            fontSize: 24.0.sp,
//                                 ),
//                                           ),
//                                       ),
//                          Expanded(
//                            child: GridView.builder(
//                              itemCount: images.length,
//                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                crossAxisCount: 3,  // 3 images per row
//                                crossAxisSpacing: 5,
//                                mainAxisSpacing: 5,
//                              ),
//                            itemBuilder: (context, index) {
//                              return Image.file(
//                                images[index],
//                                fit: BoxFit.cover,
//                              );
//                            },
//                          ),
//                        ), */
                    
//                        SizedBox(height: 30.0.sp),
//                        Align(
//                                  alignment: Alignment.topLeft,
//                                  child: SizedBox(
//                                      width: 300.0.sp,
//                                      height: 100.0.sp,
//                                      child: TextField(
//                                          onChanged: (text) {
//                                            detailsGiven(text);
//                                          },
//                                          decoration: InputDecoration(
//                                          labelText: 'Details about the incident',
//                                          border: OutlineInputBorder(),
//                                          fillColor: Colors.white,
//                                          )
//                                        ),
//                                    ),
//                                ),
//                        Spacer(),
//                          Row( // creates a row for the buttons
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: [
                                        
//                                IconButton( // icon button 1 - home
//                                  onPressed: () { // takes you to home page
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/home.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
    
//                                IconButton( // icon button 1 - back
//                                  onPressed: () { // takes you to home page
//                                    page = page - 1;
//                                    if (page < 1) {
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    } else if (page == 2) {
//                                      changePage();
//                                    } 
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/back.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
//                                IconButton( // icon button 1 - home
//                                  onPressed: () { // takes you to home page
//                                    page = page + 1;
//                                    if (page > 3) {
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePage()),
//                                    );
//                                    } else {
//                                      changePage();
//                                    }
                                
                                
//                                    },
//                                  icon:
//                                    Image.asset( // place image as the child of the container
//                                      'assets/next.png', // access image from assets folder
//                                      width: 70.0.sp,
//                                      height: 70.0.sp, 
//                                      fit: BoxFit.contain, // contain image      
//                                    ),
//                                ),
     
//                                         ],),
                    
//                        ],),
//                      ),)
//                  ],),
//                  ),
//      );
 
//              },);
//   }
//   }
//  class AntiBullying_Squad extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column (
//       children:[
//         Text("ANTI BULLYING SQUAD INFO HERE")
//       ]
//     );
//   } }
//  class Alert_an_adult extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column (
//       children:[
//         Text("ALERT AN ADULT")
//       ]
//     );
//   } }