/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:plantit/services/database.dart';
import 'package:plantit/utils/SizeHelper.dart';
import 'package:provider/provider.dart';

import '../utils/ButtomNavBar.dart';
import '../utils/TopAppBar.dart';

import '../services/auth.dart';
import '../models/user.dart';

class HomeTab extends StatefulWidget {


  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final AuthService _auth = AuthService();

  final int barIndex = 1; //inital Index Position of HomeTab within ButtomNavBar

  int score = 0;

  @override
  void initState() {
    super.initState();
    getUserScore();

  }


  void getUserScore() async {
    User currentUser = await _auth.getCurrentUser();
    int score = await DataBaseService(uid: currentUser.uid).getUserScore();
    //DataBaseService(uid: currentUser.uid).addHistoryEntry(Challenge('Stone', 'Lorem ipsum dolor sit amet, consetetur saipscing'));
    print(score);

    setState(() {
      this.score = score;
    });
  }

  Widget getTreeImage() {

    if(score >= 250) {
      return Container(
        margin: EdgeInsets.only(bottom: getDisplayHeight(context) * 0.167),
        height: 125,
        child: Image.asset("assets/images/tree/tree_02.png"),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: getDisplayHeight(context) * 0.165),
        height: 100,
        child: Image.asset("assets/images/tree/tree_01.png"),
      );
    }

  }




  @override
  Widget build(BuildContext context) {


    return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background/Mid_MainTab.png"),
                  fit: BoxFit.fill,
                )),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        margin: new EdgeInsets.fromLTRB(30, 50, 30, 30),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Score: $score",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                    color: Color(0xff3E3E3E),
                                    fontFamily: 'Montserrat')),
                            /*
                            Text(
                              "Dies ist ein Platzhalter.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Color(0xff3E3E3E),
                                  fontFamily: 'MontserratLight'),
                            ),
                             */



                            //Container( decoration: new BoxDecoration(borderRadius: new BorderRadius.all(Radius.circular(50)), color: Colors.grey), child: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 50,), margin: new EdgeInsets.fromLTRB(15,25,0,0),)
                          ],
                        )),
                  ],
                ),

                //Bird Animation
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 110),
                    height: 175,
                    width: 175,
                    child: FlareActor(
                      "assets/animations/bird.flr",
                      animation: "Untitled",
                    ),
                  ),
                ),

                Align(
                    alignment: Alignment.bottomCenter,
                    child: getTreeImage()
                )


                //NavBar2(barIndex)
              ],
            ),
          ),
        );
  }
}