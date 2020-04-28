import 'package:flutter/material.dart';
import 'package:plantit/pages/Homepage.dart';
import 'IntroSlide1.dart';
import 'IntroSlide2.dart';
import 'IntroSlide3.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MyIntroView extends StatelessWidget {

  final List<Widget> pages=[IntroSlide1(), IntroSlide2(), IntroSlide3()];

  void checkStatus(context) async {
    final prefs = await SharedPreferences.getInstance();
    final bool alreadystarted = prefs.getBool('alreadystarted');
    print("var + $alreadystarted");
    /*
    if(alreadystarted != null && alreadystarted == true) { //App wurde bereits gestartet
      print("Öffne Hauptmenü");
      Navigator.pushReplacementNamed(context, HomePage.routeName); //Wechsle zu HauptScreen
      return;
    } else { //Schlüssel == null -> App wurde somit noch nicht gestartet
      prefs.setBool('alreadystarted', true);
      //STARTE APPINTRO - Nur für den ersten AppStart
    }
    */
  }



  @override
  Widget build(BuildContext context) {
    checkStatus(context);

    return PageView.builder(
      controller: PageController(initialPage: 0),
      scrollDirection: Axis.vertical,
      itemCount: pages.length,
      itemBuilder: (context, position) => pages[position],
    );
  }
}