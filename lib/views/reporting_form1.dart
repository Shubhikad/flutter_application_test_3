import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; // import the basic package
import 'package:flutter_application_test_3/firebase_options.dart'; // import the tools for firebase
import 'package:flutter_screenutil/flutter_screenutil.dart'; // import the tools needed to adjust the screensize

class ReportingFormView extends StatefulWidget {
  const ReportingFormView({super.key});

  @override
  State<ReportingFormView> createState() =>
      _ReportingFormViewState(); // create a state to keep track of changing variables
}

class _ReportingFormViewState extends State<ReportingFormView> {
  // List<String> docIds = [];
  // final user = FirebaseAuth.instance.currentUser!;
  //   Future getDocId() async {
  //   await FirebaseFirestore.instance.collection('Users').get().then(
  //   (snapshot)=>snapshot.docs.forEach((element){
  //     print(element.reference);
  //     docIds.add(element.reference.id);
  //   }));
  // }

// variables to inlude in database
  var type = ""; // type of bullying (online/offline)
  var location =
      ""; // location (if offline: in school / bus / outside or if online instagram / whatsapp / snapchat / games / other)
  String? date = "";
  String? time = "";

  DateTime? dateTemp = DateTime.now(); // date of incident
  TimeOfDay? timeTemp = TimeOfDay.now(); // time of incident
// details of incident
  late final TextEditingController _details;
// victims names

  late final TextEditingController _victim;
  late final TextEditingController _victim2;
  late final TextEditingController _victim3;
// bullies names
  late final TextEditingController _bully;
  late final TextEditingController _bully2;
  late final TextEditingController _bully3;
// witnesses names
  late final TextEditingController _witness;
  late final TextEditingController _witness2;
  late final TextEditingController _witness3;

// booleans to keep track if a button is pressed or a value has been chosen
  bool onlinePressed = false;
  bool offlinePressed = false;
  bool inSchoolPressed = false;
  bool outsideSchoolPressed = false;
  bool onTheBusPressed = false;
  bool instagramPressed = false;
  bool snapchatPressed = false;
  bool whatsappPressed = false;
  bool gamesPressed = false;
  bool otherPressed = false;
  bool dateChosen = false;
  bool timeChosen = false;

  int page = 1; // variable to keep track of current page of reporting form
  int victims = 1; // number of victims
  int bullies = 1; // number of bullies
  int witnesses = 1; // number of witnesses

  void typeOnline() {
    // carried out when button is clicked
    setState(() {
      type = "online"; // sets type to online
      onlinePressed =
          !onlinePressed; // presses the button if not pressed and unpresses if pressed
      offlinePressed = false; // unpresses other button
    });
  }

  void typeOffline() {
    // carried out when button is clicked
    setState(() {
      type = "offline"; // sets type to offline
      offlinePressed =
          !offlinePressed; // presses the button if not pressed and unpresses if pressed
      onlinePressed = false; // unpresses other button
    });
  }

  void inSchool() {
    // carried out when button is clicked
    setState(() {
      location = "In School"; // sets location to in school
      inSchoolPressed =
          !inSchoolPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      outsideSchoolPressed = false;
      onTheBusPressed = false;
    });
  }

  void onTheBus() {
    // carried out when button is clicked
    setState(() {
      location = "On the bus"; // sets location to on the bus
      onTheBusPressed =
          !onTheBusPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      outsideSchoolPressed = false;
      inSchoolPressed = false;
    });
  }

  void outsideSchool() {
    // carried out when button is clicked
    setState(() {
      location = "Outside School"; // sets location to outside school
      outsideSchoolPressed =
          !outsideSchoolPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      inSchoolPressed = false;
      onTheBusPressed = false;
    });
  }

  void instagram() {
    // carried out when button is clicked
    setState(() {
      location = "Instagram"; // sets location to instagram
      instagramPressed =
          !instagramPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      snapchatPressed = false;
      whatsappPressed = false;
      gamesPressed = false;
      otherPressed = false;
    });
  }

  void snapchat() {
    // carried out when button is clicked
    setState(() {
      location = "Snapchat"; // sets location to snapchat
      snapchatPressed =
          !snapchatPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      whatsappPressed = false;
      instagramPressed = false;
      gamesPressed = false;
      otherPressed = false;
    });
  }

  void whatsapp() {
    // carried out when button is clicked
    setState(() {
      location = "Whatsapp"; // sets location to whatsapp
      whatsappPressed =
          !whatsappPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      snapchatPressed = false;
      instagramPressed = false;
      gamesPressed = false;
      otherPressed = false;
    });
  }

  void games() {
    // carried out when button is clicked
    setState(() {
      location = "Games"; // sets location to games
      gamesPressed =
          !gamesPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      snapchatPressed = false;
      instagramPressed = false;
      whatsappPressed = false;
      otherPressed = false;
    });
  }

  void other() {
    // carried out when button is clicked
    setState(() {
      location = "Games"; // sets location to other
      otherPressed =
          !otherPressed; // presses the button if not pressed and unpresses if pressed
      // unpresses other buttons
      snapchatPressed = false;
      instagramPressed = false;
      whatsappPressed = false;
      gamesPressed = false;
    });
  }

  void date_picker(BuildContext context) {
    showDatePicker( // picks the date
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() { // stores value of date and changes button colour
        dateTemp = value;
        dateChosen = true;
      });
    });
  }

  void time_picker(BuildContext context) {
    showTimePicker(context: context, initialTime: TimeOfDay.now()) // picks the date
        .then((value) {
      setState(() { // stores value of time and changes button colour
        timeTemp = value;
        timeChosen = true;
       
      });
    });
  }

  void setDate() {
    setState(() {
      date = dateTemp?.toIso8601String(); // converts variable to string so can be stored
    });
  }

  void setTime() {
    setState(() {
      time = timeTemp?.format(context); // converts variable to string so can be stored
    });
  }

  void initState() { // stores all text fields as controllers
    _victim = TextEditingController();
    _victim2 = TextEditingController();
    _victim3 = TextEditingController();
    _bully = TextEditingController();
    _bully2 = TextEditingController();
    _bully3 = TextEditingController();
    _witness = TextEditingController();
    _witness2 = TextEditingController();
    _witness3 = TextEditingController();
    _details = TextEditingController();
    super.initState();
  }

  @override
  void dispose() { // disposes of all text fields which are controllers
    _victim.dispose();
    _victim2.dispose();
    _victim3.dispose();
    _bully.dispose();
    _bully2.dispose();
    _bully3.dispose();
    _witness.dispose();
    _witness2.dispose();
    _witness3.dispose();
    _details.dispose();
    super.dispose();
  }

  void nameOfVictimChosen(String name) { // stores victims names
    if (victims == 1) {
      setState(() {
        _victim.text = name; 
      });
    } else if (victims == 2) {
      setState(() {
        _victim2.text = name;
      });
    } else if (victims == 3) {
      setState(() {
        _victim3.text = name;
      });
    }
  }

  void addAVictim() { // increases victim count
    setState(() {
      victims = victims + 1;
    });
  }

  void removeAVictim() { // decreases victim count
    setState(() {
      victims = victims - 1;
    });
  }

  void nameOfBullyChosen(String name) { // stores bullies names
    if (bullies == 1) {
      setState(() {
        _bully.text = name;
      });
    } else if (bullies == 2) {
      setState(() {
        _bully2.text = name;
      });
    } else if (bullies == 3) {
      setState(() {
        _bully3.text = name;
      });
    }
  }

  void addABully() { // increases bully count
    setState(() {
      bullies = bullies + 1;
    });
  }

  void removeABully() { // decreases bully count
    setState(() {
      bullies = bullies - 1;
    });
  }

  void changePage() { // changes page
    setState(() {
      page = page;
    });
  }

  void nameOfWitnessChosen(String name) { // stores witnesses names
    if (witnesses == 1) {
      setState(() {
        _witness.text = name;
      });
    } else if (witnesses == 2) {
      setState(() {
        _witness2.text = name;
      });
    } else if (witnesses == 3) {
      setState(() {
        _witness3.text = name;
      });
    }
  }

  void addAWitness() { // increases witness count
    setState(() {
      witnesses = witnesses + 1;
    });
  }

  void removeAWitness() { // decreases witness count
    setState(() {
      witnesses = witnesses - 1;
    });
  }

  void detailsGiven(String text) { // stores details
    setState(() {
      _details.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.done:
              return ScreenUtilInit(
                designSize: Size(430, 932),
                builder: (context, child) {
                  const defaultTextStyle = TextStyle(
                    // creates a default text style
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Open Sans',
                    letterSpacing: 0.5,
                    fontSize: 20,
                    height: 2,
                    decoration: TextDecoration.none,
                  );

                  const titleTextStyle = TextStyle(
                    // creates a title text style
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Open Sans',
                    letterSpacing: 0.5,
                    fontSize: 28,
                    height: 2,
                    decoration: TextDecoration.none,
                  );

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

                  const buttonTextStyle = TextStyle(
                    // creates a title text style
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Open Sans',
                    letterSpacing: 0.5,
                    fontSize: 16,
                    height: 2,
                    decoration: TextDecoration.none,
                  );
                  final Size screenSize = MediaQuery.of(context).size;
                  final double height = screenSize.height;
                  double topPadding = MediaQuery.of(context).padding.top;

                  return Scaffold(
                    resizeToAvoidBottomInset: true,
                    body: SingleChildScrollView(
                      child: DefaultTextStyle.merge(
                        // applies default text style to everything
                        style: defaultTextStyle.copyWith(
                          fontSize: 20.0.sp,
                        ),
                        child: Column(
                          children: [
                            // page 1
                            Visibility(
                              visible: page == 1,
                              child: Stack(children: [
                                Image.asset(
                                  "lib/images/Android Large - 12.png",
                                  fit: BoxFit.contain), // sets background
                                
                                Container(
                                  height: height,
                                  //color: Color(0xFFEB7C10),
                                  padding: EdgeInsets.all(10.0.sp),
                                  child: Column(
                                    // creates a column for the data in the page
                                    children: [
                                      Container(
                                        // creates a container for the title text
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: topPadding,
                                            bottom: 0.0.sp,
                                            left: 10.0.sp,
                                            right: 10.0.sp),
                                        child: Text(
                                          'Reporting Form',
                                          style: titleTextStyle.copyWith(
                                            fontSize: 28.0.sp,
                                          ), // changes default style to title text
                                        ),
                                      ),
                                      Container(
                                        // creates a container for the subtitle text
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 0.0,
                                            bottom: 20.0.sp,
                                            left: 10.0.sp,
                                            right: 10.0.sp),
                                        child: Text(
                                            'Speak out about instances of bullying that you or someone around you has experienced.',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      Container(
                                        // creates a line
                                        width: 9000.0,
                                        height: 2.0.sp,
                                        color: Colors.white,
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      Column(
                                        // creates a column for the questions which need to be center aligned
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10.0.sp),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.all(10.0.sp),
                                            child: Text(
                                              'Which category of bullying is this?',
                                            ),
                                          ),
                                          Row(
                                            // creates a row for all 3 buttons
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: 190.sp,
                                                height: 60.0.sp,
                                                child: ElevatedButton( // offline button
                                                  onPressed: () {
                                                    typeOffline();
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        offlinePressed
                                                            ? Color(0xFFF2BE0F)
                                                            : const Color(
                                                                0xFFEB7C10),
                                                    foregroundColor: Colors.white,
                                                    side: BorderSide(
                                                        color: Colors.white,
                                                        width: 2.0.sp),
                                                  ),
                                                  child: Text(
                                                    'In-Person',
                                                    style: bigButtonTextStyle
                                                        .copyWith(
                                                      fontSize: 24.0.sp,
                                                    ), // changes default style to title text
                                                  ),
                                                ),
                                              ),
                                              SizedBox( 
                                                width: 170.sp,
                                                height: 60.0.sp,
                                                child: ElevatedButton( // online button
                                                  onPressed: () {
                                                    typeOnline();
                                                  },
                                                  style: ElevatedButton.styleFrom( 
                                                    backgroundColor: onlinePressed
                                                        ? Color(0xFFF2BE0F)
                                                        : const Color(0xFFEB7C10),
                                                    foregroundColor: Colors.white,
                                                    side: BorderSide(
                                                        color: Colors.white,
                                                        width: 2.0.sp),
                                                  ),
                                                  child: Text(
                                                    'Online',
                                                    style: bigButtonTextStyle
                                                        .copyWith(
                                                      fontSize: 24.0.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0.sp),
                                          Visibility(
                                            // creates a visibility widget for the second question if offline
                                            visible: !onlinePressed,
                                            child: Column(
                                              children: [
                                                // creates a column to store multiple visibility widgets
                                                Container(
                                                  // creates a container for the text
                                                  alignment: Alignment.centerLeft,
                                                  padding:
                                                      EdgeInsets.all(10.0.sp),
                                                  child: Text(
                                                    'Where did the incident happen?',
                                                  ),
                                                ),
                      
                                                Row(
                                                  // creates a row for the 3 buttons
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width: 128.0.sp,
                                                      height: 60.0.sp,
                                                      child: ElevatedButton( // in school button
                                                        onPressed: () {
                                                          inSchool();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              inSchoolPressed
                                                                  ? Color(
                                                                      0xFFF2BE0F)
                                                                  : const Color(
                                                                      0xFFEB7C10),
                                                          foregroundColor:
                                                              Colors.white,
                                                          side: BorderSide(
                                                              color: Colors.white,
                                                              width: 2.0.sp),
                                                        ),
                                                        child: Text(
                                                          'In School',
                                                          style: buttonTextStyle
                                                              .copyWith(
                                                            fontSize: 15.0.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.0.sp),
                                                    SizedBox(
                                                      width: 140.0.sp,
                                                      height: 60.0.sp,
                                                      child: ElevatedButton( // on the bus button
                                                        onPressed: () {
                                                          onTheBus();
                                                        },
                                                        style: ElevatedButton 
                                                            .styleFrom(
                                                          backgroundColor:
                                                              onTheBusPressed
                                                                  ? Color(
                                                                      0xFFF2BE0F)
                                                                  : const Color(
                                                                      0xFFEB7C10),
                                                          foregroundColor:
                                                              Colors.white,
                                                          side: BorderSide(
                                                              color: Colors.white,
                                                              width: 2.0.sp),
                                                        ),
                                                        child: Text(
                                                          'On the bus',
                                                          style: buttonTextStyle
                                                              .copyWith(
                                                            fontSize: 15.0.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.0.sp),
                                                    SizedBox(
                                                      width: 116.0.sp,
                                                      height: 60.0.sp,
                                                      child: ElevatedButton( // outside button
                                                        onPressed: () {
                                                          outsideSchool();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              outsideSchoolPressed
                                                                  ? Color(
                                                                      0xFFF2BE0F)
                                                                  : const Color(
                                                                      0xFFEB7C10),
                                                          foregroundColor:
                                                              Colors.white,
                                                          side: BorderSide(
                                                              color: Colors.white,
                                                              width: 2.0.sp),
                                                        ),
                                                        child: Text(
                                                          'Outside',
                                                          style: buttonTextStyle
                                                              .copyWith(
                                                            fontSize: 15.0.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            // creates a visibility widget for the second question if online
                                            visible: onlinePressed,
                                            child: Column(
                                              children: [
                                                // creates a column to store multiple visibility widgets
                                                Container(
                                                  // creates a container to store text
                                                  alignment: Alignment.centerLeft,
                                                  padding:
                                                      EdgeInsets.all(10.0.sp),
                                                  child: Text(
                                                    'Where did the incident happen?',
                                                  ),
                                                ),
                      
                                                Row(
                                                  // creates a row for the buttons
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    IconButton(
                                                      // icon button 1 - instagram
                                                      onPressed: () {
                                                        instagram(); // when pressed, carry out instagram function
                                                      },
                      
                                                      icon: Container(
                                                        // place icon in a container so border can be added
                                                        width: 65.0
                                                            .sp, // width = width of image + border
                                                        height: 65.0
                                                            .sp, // height = height of image + border
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            // constant border throughout
                                                            color: instagramPressed
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent, // when pressed, border becomes visible and white
                                                            width: 3.0.sp,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  12.0), // most apps are rounded squares
                                                        ),
                      
                                                        child: Image.asset(
                                                          // place image as the child of the container
                                                          'lib/images/instagram_logo.png', // access image from lib/images folder
                                                          width: 50.0.sp,
                                                          height: 50.0.sp,
                                                          fit: BoxFit
                                                              .contain, // contain image
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      // icon button 2 - snapchat
                                                      onPressed: () {
                                                        snapchat(); // when pressed, carry out snapchat function
                                                      },
                      
                                                      icon: Container(
                                                        // place icon in a container so border can be added
                                                        width: 65.0
                                                            .sp, // width = width of image + border
                                                        height: 65.0
                                                            .sp, // height = height of image + border
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            // constant border throughout
                                                            color: snapchatPressed
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent, // when pressed, border becomes visible and white
                                                            width: 3.0.sp,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16.0), // most apps are rounded squares
                                                        ),
                      
                                                        child: Image.asset(
                                                          // place image as the child of the container
                                                          'lib/images/snapchat_logo.png', // access image from lib/images folder
                                                          width: 60.0.sp,
                                                          height: 60.0.sp,
                                                          fit: BoxFit
                                                              .contain, // contain image
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      // icon button 3 - whatsapp
                                                      onPressed: () {
                                                        whatsapp(); // when pressed, carry out whatsapp function
                                                      },
                      
                                                      icon: Container(
                                                        // place icon in a container so border can be added
                                                        width: 65.0
                                                            .sp, // width = width of image + border
                                                        height: 65.0
                                                            .sp, // height = height of image + border
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            // constant border throughout
                                                            color: whatsappPressed
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent, // when pressed, border becomes visible and white
                                                            width: 3.0.sp,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16.0), // most apps are rounded squares
                                                        ),
                      
                                                        child: Image.asset(
                                                          // place image as the child of the container
                                                          'lib/images/whatsapp_logo.png', // access image from lib/images folder
                                                          width: 50.0.sp,
                                                          height: 50.0.sp,
                                                          fit: BoxFit
                                                              .contain, // contain image
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      // icon button 4 - games (refers to any kind of online games)
                                                      onPressed: () {
                                                        games(); // when pressed, carry out games function
                                                      },
                      
                                                      icon: Container(
                                                        // place icon in a container so border can be added
                                                        width: 65.0
                                                            .sp, // width = width of image + border
                                                        height: 65.0
                                                            .sp, // height = height of image + border
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            // constant border throughout
                                                            color: gamesPressed
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent, // when pressed, border becomes visible and white
                                                            width: 3.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16.0), // most apps are rounded squares
                                                        ),
                      
                                                        child: Image.asset(
                                                          // place image as the child of the container
                                                          'lib/images/games_logo.png', // access image from lib/images folder
                                                          width: 50.0.sp,
                                                          height: 50.0.sp,
                                                          fit: BoxFit
                                                              .contain, // contain image
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      // icon button 5 - other
                                                      onPressed: () {
                                                        other(); // when pressed, carry out other function
                                                      },
                      
                                                      icon: Container(
                                                        // place icon in a container so border can be added
                                                        width: 65.0
                                                            .sp, // width = width of image + border
                                                        height: 65.0
                                                            .sp, // height = height of image + border
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            // constant border throughout
                                                            color: otherPressed
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent, // when pressed, border becomes visible and white
                                                            width: 3.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16.0), // most apps are rounded squares
                                                        ),
                      
                                                        child: Image.asset(
                                                          // place image as the child of the container
                                                          'lib/images/other_logo.png', // access image from lib/images folder
                                                          width: 50.0.sp,
                                                          height: 50.0.sp,
                                                          fit: BoxFit
                                                              .contain, // contain image
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30.0.sp),
                                          Container(
                                            // creates a container to store text
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.all(10.0.sp),
                                            child: Text(
                                              'When did the incident happen?',
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton( // date picker
                                                onPressed: () {
                                                    date_picker(context);
                                                    setDate();
                                                    },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: dateChosen
                                                      ? Color(0xFFF2BE0F)
                                                      : const Color(0xFFEB7C10),
                                                  foregroundColor: Colors.white,
                                                  side: BorderSide(
                                                      color: Colors.white,
                                                      width: 2.0),
                                                ),
                                                child: Text(
                                                  'Date',
                                                  style:
                                                      bigButtonTextStyle.copyWith(
                                                    fontSize: 24.0.sp,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton( // time picker
                                                onPressed: () {
                                                    time_picker(context);
                                                    setTime();},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: timeChosen
                                                      ? Color(0xFFF2BE0F)
                                                      : const Color(0xFFEB7C10),
                                                  foregroundColor: Colors.white,
                                                  side: BorderSide(
                                                      color: Colors.white,
                                                      width: 2.0),
                                                ),
                                                child: Text(
                                                  'Time',
                                                  style:
                                                      bigButtonTextStyle.copyWith(
                                                    fontSize: 24.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        // creates a row for the buttons
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            // icon button - home
                                            onPressed: () {
                                              // takes you to home page
                                              Navigator.pushNamed(
                                                  context, '/HomePage');
                                            },
                                            icon: Image.asset(
                                              // place image as the child of the container
                                              'lib/images/home.png', // access image from lib/images folder
                                              width: 70.0.sp,
                                              height: 70.0.sp,
                                              fit:
                                                  BoxFit.contain, // contain image
                                            ),
                                          ),
                                          IconButton(
                                            // icon button - back
                                            onPressed: () {
                                              page = page - 1;
                                              if (page < 1) {
                                                Navigator.pushNamed(
                                                    context, '/HomePage');
                                              } else if (page == 2) {
                                                changePage();
                                              }
                                            },
                                            icon: Image.asset(
                                              // place image as the child of the container
                                              'lib/images/back.png', // access image from lib/images folder
                                              width: 70.0.sp,
                                              height: 70.0.sp,
                                              fit:
                                                  BoxFit.contain, // contain image
                                            ),
                                          ),
                                          IconButton(
                                            // icon button  - home
                                            onPressed: () {
                                              // takes you to home page
                                              page = page + 1;
                                              if (page > 3) {
                                                Navigator.pushNamed(
                                                    context, '/HomePage');
                                              } else {
                                                changePage();
                                              }
                                            },
                                            icon: Image.asset(
                                              // place image as the child of the container
                                              'lib/images/next.png', // access image from lib/images folder
                                              width: 70.0.sp,
                                              height: 70.0.sp,
                                              fit:
                                                  BoxFit.contain, // contain image
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.0.sp),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                      
                            // page 2
                            Visibility(
                              visible: page == 2,
                              maintainSize: false,
                              child: Stack(
                                children: [
                                  Image.asset("lib/images/Android Large - 12.png"), // background image
                                  Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.all(10.0.sp),
                                      height: height,
                                      child: 
                                           Column(
                                            children: [
                                              Container(
                                                color: Colors.transparent,
                                                // creates a container for the title text
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: topPadding,
                                                    bottom: 0.0.sp,
                                                    left: 10.0.sp,
                                                    right: 10.0.sp),
                                                child: Text(
                                                  'Reporting Form',
                                                  style: titleTextStyle.copyWith(
                                                    fontSize: 28.0.sp,
                                                  ),
                                                  // changes default style to title text
                                                ),
                                              ),
                                              Container(
                                                // creates a container for the subtitle text
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0,
                                                    bottom: 20.0.sp,
                                                    left: 10.0.sp,
                                                    right: 10.0.sp),
                                                child: Text(
                                                    'Tell us about the people involved...',
                                                    style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontWeight: FontWeight.w400)),
                                              ),
                                              Container(
                                                // creates a line
                                                width: 9000.0,
                                                height: 2.0,
                                                color: Colors.white,
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              SizedBox(height: 30.0.sp),
                                              Row(
                                                children: [
                                                  Align( // victim 1
                                                    alignment: Alignment.topLeft,
                                                    child: SizedBox(
                                                      width: 300.0.sp,
                                                      height: 60.0.sp,
                                                      child: TextField(
                                                        controller: _victim,
                                                        enableSuggestions: false,
                                                        autocorrect: false,
                                                        keyboardType:
                                                            TextInputType.name,
                                                        decoration:
                                                            const InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 20.0,
                                                                style:
                                                                    BorderStyle.solid,
                                                                color: Colors.black,
                                                                strokeAlign: BorderSide
                                                                    .strokeAlignCenter),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        7)),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding:
                                                              EdgeInsets.all(10.0),
                                                          hintText: 'Name of Victim',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      if (victims < 4) {
                                                        addAVictim();
                                                      }
                                                    },
                                                    icon: Image.asset(
                                                      // place image as the child of the container
                                                      'lib/images/plus.png', // access image from lib/images folder
                                                      width: 60.0.sp,
                                                      height: 60.0.sp,
                                                      fit: BoxFit
                                                          .contain, // contain image
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.0.sp),
                                    
                                              Visibility( // victim 2
                                                visible: (victims > 1),
                                                child: Row(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: SizedBox(
                                                        width: 300.0.sp,
                                                        height: 60.0.sp,
                                                        child: TextField(
                                                          controller: _victim2,
                                                          enableSuggestions: false,
                                                          autocorrect: false,
                                                          keyboardType:
                                                              TextInputType.name,
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 20.0,
                                                                  style: BorderStyle
                                                                      .solid,
                                                                  color: Colors.black,
                                                                  strokeAlign: BorderSide
                                                                      .strokeAlignCenter),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          7)),
                                                            ),
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            contentPadding:
                                                                EdgeInsets.all(10.0),
                                                            hintText:
                                                                'Name of Victim 2',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        if (victims > 1) {
                                                          removeAVictim();
                                                        }
                                                      },
                                                      icon: Image.asset(
                                                        // place image as the child of the container
                                                        'lib/images/minus.png', // access image from lib/images folder
                                                        width: 60.0.sp,
                                                        height: 60.0.sp,
                                                        fit: BoxFit
                                                            .contain, // contain image
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0.sp),
                                              Visibility( // victim 3
                                                visible: (victims > 2),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: SizedBox(
                                                        width: 300.0.sp,
                                                        height: 60.0.sp,
                                                        child: TextField(
                                                          controller: _victim3,
                                                          enableSuggestions: false,
                                                          autocorrect: false,
                                                          keyboardType:
                                                              TextInputType.name,
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 20.0,
                                                                  style: BorderStyle
                                                                      .solid,
                                                                  color: Colors.black,
                                                                  strokeAlign: BorderSide
                                                                      .strokeAlignCenter),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          7)),
                                                            ),
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            contentPadding:
                                                                EdgeInsets.all(10.0),
                                                            hintText:
                                                                'Name of Victim 3',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "If there are more victims, mention it in the additional details section later.",
                                                      style: TextStyle(
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Align( // bully 1
                                                    alignment: Alignment.topLeft,
                                                    child: SizedBox(
                                                      width: 300.0.sp,
                                                      height: 60.0.sp,
                                                      child: TextField(
                                                        controller: _bully,
                                                        enableSuggestions: false,
                                                        autocorrect: false,
                                                        keyboardType:
                                                            TextInputType.name,
                                                        decoration:
                                                            const InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 20.0,
                                                                style:
                                                                    BorderStyle.solid,
                                                                color: Colors.black,
                                                                strokeAlign: BorderSide
                                                                    .strokeAlignCenter),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        7)),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding:
                                                              EdgeInsets.all(10.0),
                                                          hintText: 'Name of Bully',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      if (bullies < 4) {
                                                        addABully();
                                                      }
                                                    },
                                                    icon: Image.asset(
                                                      // place image as the child of the container
                                                      'lib/images/plus.png', // access image from lib/images folder
                                                      width: 60.0.sp,
                                                      height: 60.0.sp,
                                                      fit: BoxFit
                                                          .contain, // contain image
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.0.sp),
                                              Visibility( // bully 2
                                                visible: (bullies > 1),
                                                child: Row(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: SizedBox(
                                                        width: 300.0.sp,
                                                        height: 60.0.sp,
                                                        child: TextField(
                                                          controller: _bully2,
                                                          enableSuggestions: false,
                                                          autocorrect: false,
                                                          keyboardType:
                                                              TextInputType.name,
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 20.0,
                                                                  style: BorderStyle
                                                                      .solid,
                                                                  color: Colors.black,
                                                                  strokeAlign: BorderSide
                                                                      .strokeAlignCenter),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          7)),
                                                            ),
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            contentPadding:
                                                                EdgeInsets.all(10.0),
                                                            hintText:
                                                                'Name of Bully 2',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        if (bullies > 1) {
                                                          removeABully();
                                                        }
                                                      },
                                                      icon: Image.asset(
                                                        // place image as the child of the container
                                                        'lib/images/minus.png', // access image from lib/images folder
                                                        width: 60.0.sp,
                                                        height: 60.0.sp,
                                                        fit: BoxFit
                                                            .contain, // contain image
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0.sp),
                                              Visibility( // bully 3
                                                visible: (bullies > 2),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: SizedBox(
                                                        width: 300.0.sp,
                                                        height: 60.0.sp,
                                                        child: TextField(
                                                          controller: _bully3,
                                                          enableSuggestions: false,
                                                          autocorrect: false,
                                                          keyboardType:
                                                              TextInputType.name,
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 20.0,
                                                                  style: BorderStyle
                                                                      .solid,
                                                                  color: Colors.black,
                                                                  strokeAlign: BorderSide
                                                                      .strokeAlignCenter),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          7)),
                                                            ),
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            contentPadding:
                                                                EdgeInsets.all(10.0),
                                                            hintText:
                                                                'Name of Bully 3',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "If there are more bullies, mention it in the additional details section later.",
                                                      style: TextStyle(
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                // creates a row for the buttons
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  IconButton(
                                                    // icon button  - home
                                                    onPressed: () {
                                                      // takes you to home page
                                                      Navigator.pushNamed(
                                                          context, '/HomePage');
                                                    },
                                                    icon: Image.asset(
                                                      // place image as the child of the container
                                                      'lib/images/home.png', // access image from lib/images folder
                                                      width: 70.0.sp,
                                                      height: 70.0.sp,
                                                      fit: BoxFit
                                                          .contain, // contain image
                                                    ),
                                                  ),
                                                  IconButton(
                                                    // icon button - back
                                                    onPressed: () {
                                                      // takes you to home page
                                                      page = page - 1;
                                                      if (page < 1) {
                                                        Navigator.pushNamed(
                                                            context, '/HomePage');
                                                      } else {
                                                        changePage();
                                                      }
                                                    },
                                                    icon: Image.asset(
                                                      // place image as the child of the container
                                                      'lib/images/back.png', // access image from lib/images folder
                                                      width: 70.0.sp,
                                                      height: 70.0.sp,
                                                      fit: BoxFit
                                                          .contain, // contain image
                                                    ),
                                                  ),
                                                  IconButton(
                                                    // icon button  - home
                                                    onPressed: () {
                                                      // takes you to home page
                                                      page = page + 1;
                                                      if (page > 3) {
                                                        Navigator.pushNamed(
                                                            context, '/HomePage');
                                                      } else {
                                                        changePage();
                                                      }
                                                    },
                                                    icon: Image.asset(
                                                      // place image as the child of the container
                                                      'lib/images/next.png', // access image from lib/images folder
                                                      width: 70.0.sp,
                                                      height: 70.0.sp,
                                                      fit: BoxFit
                                                          .contain, // contain image
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20.0.sp),
                                            ],
                                          ),
                                        
                                      ),
                                ],
                              ),
                            ),
                      
                            // page 3
                            Visibility(
                              visible: page == 3,
                              child: Stack(
                                children: [
                                  Image.asset("lib/images/Android Large - 12.png"),
                                  Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(10.0.sp),
                                    height: height,
                                    child: Column(
                                      children: [
                                        Container(
                                          // creates a container for the title text
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              top: topPadding,
                                              bottom: 0.0.sp,
                                              left: 10.0.sp,
                                              right: 10.0.sp),
                                          child: Text(
                                            'Reporting Form',
                                            style: titleTextStyle.copyWith(
                                              fontSize: 28.0.sp,
                                            ), // changes default style to title text
                                          ),
                                        ),
                                        Container(
                                          // creates a container for the subtitle text
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              top: 0.0,
                                              bottom: 20.0.sp,
                                              left: 10.0.sp,
                                              right: 10.0.sp),
                                          child: Text("You're almost done...",
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Container(
                                          // creates a line
                                          width: 9000.0,
                                          height: 2.0.sp,
                                          color: Colors.white,
                                          padding: EdgeInsets.all(0.0),
                                        ),
                                        SizedBox(height: 30.0.sp),
                                        Row(
                                          children: [
                                            Align( // witness 1 
                                              alignment: Alignment.topLeft,
                                              child: SizedBox(
                                                width: 300.0.sp,
                                                height: 60.0.sp,
                                                child: TextField(
                                                  controller: _witness,
                                                  enableSuggestions: false,
                                                  autocorrect: false,
                                                  keyboardType: TextInputType.name,
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 20.0,
                                                          style: BorderStyle.solid,
                                                          color: Colors.black,
                                                          strokeAlign: BorderSide
                                                              .strokeAlignCenter),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(7)),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsets.all(10.0),
                                                    hintText: 'Name of Witness',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                if (witnesses < 4) {
                                                  addAWitness();
                                                }
                                              },
                                              icon: Image.asset(
                                                // place image as the child of the container
                                                'lib/images/plus.png', // access image from lib/images folder
                                                width: 60.0.sp,
                                                height: 60.0.sp,
                                                fit: BoxFit.contain, // contain image
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0.sp),
                                        Visibility( // witness 2
                                          visible: (witnesses > 1),
                                          child: Row(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: SizedBox(
                                                  width: 300.0.sp,
                                                  height: 60.0.sp,
                                                  child: TextField(
                                                    controller: _witness2,
                                                    enableSuggestions: false,
                                                    autocorrect: false,
                                                    keyboardType: TextInputType.name,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 20.0,
                                                            style: BorderStyle.solid,
                                                            color: Colors.black,
                                                            strokeAlign: BorderSide
                                                                .strokeAlignCenter),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(7)),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding:
                                                          EdgeInsets.all(10.0),
                                                      hintText: 'Name of Witness 2',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton( 
                                                onPressed: () {
                                                  if (witnesses > 1) {
                                                    removeAWitness();
                                                  }
                                                },
                                                icon: Image.asset(
                                                  // place image as the child of the container
                                                  'lib/images/minus.png', // access image from lib/images folder
                                                  width: 60.0.sp,
                                                  height: 60.0.sp,
                                                  fit:
                                                      BoxFit.contain, // contain image
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0.sp),
                                        Visibility( // witness 3
                                          visible: (witnesses > 2),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: SizedBox(
                                                  width: 300.0.sp,
                                                  height: 60.0.sp,
                                                  child: TextField(
                                                    controller: _witness3,
                                                    enableSuggestions: false,
                                                    autocorrect: false,
                                                    keyboardType: TextInputType.name,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 20.0,
                                                            style: BorderStyle.solid,
                                                            color: Colors.black,
                                                            strokeAlign: BorderSide
                                                                .strokeAlignCenter),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(7)),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding:
                                                          EdgeInsets.all(10.0),
                                                      hintText: 'Name of Witness 3',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "If there are more witnesses, mention it in the additional details section later.",
                                                style: TextStyle(
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.w400),
                                              )
                                            ],
                                          ),
                                        ),
                                        Align( // details about incident text box
                                          alignment: Alignment.topLeft,
                                          child: SizedBox(
                                            width: 300.0.sp,
                                            height: 100.0.sp,
                                            child: TextField(
                                              controller: _details,
                                              enableSuggestions: false,
                                              autocorrect: false,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 20.0,
                                                      style: BorderStyle.solid,
                                                      color: Colors.black,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(7)),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding: EdgeInsets.all(10.0),
                                                hintText:
                                                    'Details about the incident',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          // creates a row for the buttons
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              // icon button  - home
                                              onPressed: () {
                                                // takes you to home page
                                                Navigator.pushNamed(
                                                    context, '/HomePage');
                                              },
                                              icon: Image.asset(
                                                // place image as the child of the container
                                                'lib/images/home.png', // access image from lib/images folder
                                                width: 70.0.sp,
                                                height: 70.0.sp,
                                                fit: BoxFit.contain, // contain image
                                              ),
                                            ),
                                            IconButton(
                                              // icon button  - back
                                              onPressed: () {
                                                // takes you to home page
                                                page = page - 1;
                                                if (page < 1) {
                                                  Navigator.pushNamed(
                                                      context, '/HomePage');
                                                } else {
                                                  changePage();
                                                }
                                              },
                                              icon: Image.asset(
                                                // place image as the child of the container
                                                'lib/images/back.png', // access image from lib/images folder
                                                width: 70.0.sp,
                                                height: 70.0.sp,
                                                fit: BoxFit.contain, // contain image
                                              ),
                                            ),
                                            IconButton(
                                             
                                              onPressed: () async {
                                                await FirebaseFirestore.instance
                                                    .collection("ReportingForm")
                                                    .add({
                                                  'type': type,
                                                  'location': location,
                                                  'date': date,
                                                  'time': time,
                                                  'details': _details.text,
                                                  'victim1': _victim.text,
                                                  'victim2': _victim2.text,
                                                  'victim3': _victim3.text,
                                                  'bully1': _bully.text,
                                                  'bully2': _bully2.text,
                                                  'bully3': _bully3.text,
                                                  'witness1': _witness.text,
                                                  'witness2': _witness2.text,
                                                  'witness3': _witness3.text,
                                                }); 
                                                page = 4;
                                                changePage();
                                                 
                                              },
                                              icon: Image.asset(
                                                // place image as the child of the container
                                                'lib/images/submit.png', // access image from lib/images folder
                                                width: 95.0.sp,
                                                height: 25.0.sp,
                                                fit: BoxFit.contain, // contain image
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

                            // page 4 - submitted 
                            Visibility(
                              visible: (page == 4),
                              child: 
                              Container (
                                height: height,
                                color: Color(0xFFEB7C10), // background colour
                                child:
                                Column (
                                  mainAxisAlignment:
                                            MainAxisAlignment.center,
                                  children: [
                                          
                                          Container( // confirmation message
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.all(10.0.sp),
                                            child: Text(
                                              'Success! Your response has been recorded.',
                                            ),
                                          ),
                                          
                                          IconButton(
                                              // icon  home
                                              onPressed: () {
                                                // takes you to home page
                                                Navigator.pushNamed(
                                                    context, '/HomePage');
                                              },
                                              icon: Image.asset(
                                                // place image as the child of the container
                                                'lib/images/home.png', // access image from lib/images folder
                                                width: 100.0.sp,
                                                height: 100.0.sp,
                                                fit: BoxFit.contain, // contain image
                                              ),
                                            ),
                                          
                                           ],
                                )
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return const Scaffold(); // backup
          }
        });
  }
}