import 'package:flutter/material.dart';

//about bullying page
class AboutBullying extends StatelessWidget {
  const AboutBullying({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //do not show app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.transparent,
        foregroundColor: Colors.white,
        //shadowColor: Colors.grey,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        elevation: 2.0,
        //title: const Text('Register'),
      ),
      //scrollable body to see contents of infographics
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          // infographics made by us
          Image.asset("lib/images/1.png",
          fit: BoxFit.contain),
          Image.asset("lib/images/2.png",
          fit: BoxFit.contain)
        ],) ,
      ),
    );
  }
}
//information about the anti bullying squad
class AntibullyingSquadView extends StatelessWidget {
  const AntibullyingSquadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //hide app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.transparent,
        foregroundColor: Colors.white,
        //shadowColor: Colors.grey,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        elevation: 2.0,
        //title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          //infographics about anti bullying squad made by us
          Image.asset("lib/images/3.png",
          fit: BoxFit.contain),
        ],) ,
      ),
    );
  }
}