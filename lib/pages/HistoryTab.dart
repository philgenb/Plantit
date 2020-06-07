/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantit/models/challenge.dart';
import 'package:plantit/models/user.dart';
import 'package:plantit/services/auth.dart';
import 'package:plantit/services/database.dart';
import 'file:///C:/Users/Phil/Documents/AppProjekte/plantit/plantit/lib/utils/TopAppBar.dart';
import 'file:///C:/Users/Phil/Documents/AppProjekte/plantit/plantit/lib/utils/ButtomNavBar.dart';
import 'package:plantit/utils/SizeHelper.dart';

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {

  final AuthService _auth = AuthService();

  //List that holds all Challenge Items from the past
  List<Challenge> missionhistory = [
    /*
    Challenge("Tree", "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy!"),
    Challenge("Stone", "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy!"),
    Challenge("Stone", "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy!"),
    Challenge("Stone", "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy!"),
    Challenge("Stone", "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy!")
    */
  ];

  @override
  void initState() {
    super.initState();
    fetchChallengeHistory();
  }

  void fetchChallengeHistory() async {
    User currentUser = await _auth.getCurrentUser();
    List<Challenge> history = await DataBaseService(uid: currentUser.uid).getHistoryEntries();

    setState(() {
      missionhistory = history;
    });
  }

  Widget createStars(int rating) {
    Row row = Row(
      children: <Widget>[
        Text("Mission Completed!", style: TextStyle(fontSize: 15, fontFamily: "Montserrat"),),
        SizedBox(width: 7.5,),
        SvgPicture.asset('assets/images/star.svg', height: 15,),
      ],
    );

    for (int i = 1; i < rating; i++) { // one star already added -> adds remaining stars
      row.children.add(SizedBox(width: 2,));
      row.children.add(SvgPicture.asset('assets/images/star.svg', height: 15,));
    }

    return row;
  }

  @override
  Widget build(BuildContext context) {
    final int barIndex = 2;

    return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background/Right_MainTab.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Stack(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.symmetric(horizontal: getDisplayWidth(context) * 0.03, vertical: getDisplayHeight(context) * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Mission History", style: TextStyle(fontFamily: "Montserrat", fontSize: 24)),

                      SizedBox(height: getDisplayHeight(context) * 0.0225),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: missionhistory.length,
                          itemBuilder: (BuildContext context, int index) {

                            //Einzelner Mission History Eintrag
                            return Align(
                                alignment: Alignment.center,
                                child: Stack(
                                  children: <Widget>[

                                    Positioned(
                                      right: 25,
                                      bottom: 2.5,
                                      child: SizedBox(
                                        height: getDisplayHeight(context) * 0.05,
                                        width: getDisplayWidth(context) * 0.5,
                                        child: RaisedButton(
                                          padding: EdgeInsets.symmetric(vertical: 5),
                                          color: Color(0xff383838),
                                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0)),
                                          child: Align(alignment: Alignment.bottomCenter, child: Text("Read More!", style: TextStyle(fontFamily: "Montserrat", fontSize: 16, color: Colors.white))),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),

                                    Container(
                                        margin: EdgeInsets.symmetric(vertical: getDisplayHeight(context) * 0.04),
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                        width: getDisplayWidth(context) * 0.8,
                                        height: getDisplayHeight(context) * 0.2,
                                        decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(7.00,3.00),
                                              color: Color(0xff000000).withOpacity(0.16),
                                              blurRadius: 5,
                                            ),
                                          ], borderRadius: BorderRadius.circular(24.00),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text('Mission "' + missionhistory[index].title + '"', style: TextStyle(fontFamily: "Montserrat", fontSize: 18),),
                                            createStars(missionhistory[index].rating),
                                            Text(missionhistory[index].challengeText, style: TextStyle(fontFamily: "Montserrat-Light", fontSize: 16),),
                                          ],
                                        )
                                    ),



                                  ],

                                )

                            );

                          },
                        ),

                      ),

                      SizedBox(height: getDisplayHeight(context) * 0.05,)
                    ],
                  ),

                ),

                //NavBar2(barIndex)
              ],
            ),
          )
      );
  }
}





