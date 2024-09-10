import 'package:flutter/material.dart';

//page before login or register
class PreView extends StatelessWidget {
  const PreView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;
    double androidHeight = 800.0;
    double androidWidth = 360.0
;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex : 1, child: const SizedBox(width: 30)),
                  Expanded(flex: 2,child: Image.asset("lib/images/Aditya Birla Logo 1.png",)),
                ],
              ),//Row
              
              const Text(
                'BULLY ALERT',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 54,
                    color: Color.fromRGBO(0, 0, 0, 1)),//TextStyle
              ),//Text
              const SizedBox(height: 200),
              //register button
              Container(
                 width: 280,
                                height: 60,
                                    decoration: BoxDecoration(
                                  color:  Color.fromRGBO(250, 169, 19, 1),
                                  borderRadius: BorderRadius.circular(7.0),
                                  border :Border.all(color :  Colors.black)
                                ),//BoxDecoration
                child: TextButton(
                  onPressed: () {

                    Navigator.pushNamed(context, '/Register');
                  },
                  style: const ButtonStyle(
                    
                    backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(250, 169, 19, 1)),
                    
                   
                    ),//ButtonStyle
                    
                    
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.black),//TextStyle
                    textAlign: TextAlign.left,
                  ),//Text
                ),//TextButton
              ),//Conatiner
              const SizedBox(height: 20),
              //login button
              Container(
                 width: (280/androidWidth)*width,
                                height: 60,
                                    decoration: BoxDecoration(
                                  color:  Color.fromRGBO(250, 169, 19, 1),
                                  borderRadius: BorderRadius.circular(7.0),
                                  border :Border.all(color :  Colors.black)
                                ),//BoxDecoration
                child: TextButton(
                  onPressed: () {
                    
                    Navigator.pushNamed(context, '/Login');
                  },
                  style: const ButtonStyle(
                    
                
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(250, 169, 19, 1),
                    ),//MaterialState..
                    
                  ),//ButtonStyle
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.black),//TextStyle
                    textAlign: TextAlign.left,
                  ),//Text
                ),//TextButton
              )//Container
            ],
          ),//Column
        )//Center
        );//Scaffold
  }
}
