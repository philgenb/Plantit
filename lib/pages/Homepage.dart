import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:plantit/services/database.dart';
import 'package:provider/provider.dart';

import '../utils/ButtomNavBar2.dart';
import '../utils/TopAppBar.dart';

import '../services/auth.dart';
import '../models/user.dart';

class Homepage extends StatefulWidget {


  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //final AuthService _auth = AuthService();

  final int BarIndex = 1;

  int score;

/*
  @override
  void initState() async {
    //User currentUser = await _auth.getCurrentUser();
    //print(currentUser.uid);

    /*
    FirebaseUser currentuser = await _auth.getCurrentFirebaseUser();
    var s = DataBaseService(uid: currentuser.uid).getUserScore();
    */

    super.initState();
  }

 */



  @override
  Widget build(BuildContext context) {

    return StreamProvider<QuerySnapshot>.value(
      value: DataBaseService().plants,
      child: Scaffold(
          appBar: TopAppBar().getAppBar(context),
          body: SizedBox.expand(
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
                              Text("Score: 0",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Color(0xff3E3E3E),
                                      fontFamily: 'Montserrat')),
                              Text(
                                "Dies ist ein Platzhalter.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Color(0xff3E3E3E),
                                    fontFamily: 'MontserratLight'),
                              ),
                              //Container( decoration: new BoxDecoration(borderRadius: new BorderRadius.all(Radius.circular(50)), color: Colors.grey), child: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 50,), margin: new EdgeInsets.fromLTRB(15,25,0,0),)
                            ],
                          )),
                    ],
                  ),
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

                  NavBar2(BarIndex)
                ],
              ),
            ),
          )),
    );
  }
}
