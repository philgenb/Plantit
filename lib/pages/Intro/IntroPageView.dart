/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:plantit/HomePageView.dart';
import 'package:plantit/Wrapper.dart';
import 'package:plantit/pages/HomeTab.dart';
import 'IntroSlide1.dart';
import 'IntroSlide2.dart';
import 'IntroSlide3.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MyIntroView extends StatelessWidget {

  final List<Widget> pages=[IntroSlide1(), IntroSlide2(), IntroSlide3()];

  Future<bool> checkStatus(context) async {
    final prefs = await SharedPreferences.getInstance();
    final bool alreadystarted = prefs.getBool('alreadystarted');
    //print("var + $alreadystarted");

    if(alreadystarted != null && alreadystarted == true) { //App was already started
      print("Öffne Hauptmenü");
      return true;
    } else { //Key == null -> App was not started before; First App start
      prefs.setBool('alreadystarted', true);
      return false;
      //Start Appintro - only for the first AppStart
    }

  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkStatus(context), //waiting for Status -> Rebuild after completion
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return CircularProgressIndicator(); //shows the current progress
        } else if(snapshot.data == false) { //First App Start; calls IntroPageView which guides the user through the App
          return PageView.builder(
            controller: PageController(initialPage: 0),
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: pages.length,
            itemBuilder: (context, position) => pages[position],
          );

        } else {
          return Wrapper();
        }
      },
      initialData: null,
    );


  }

}