/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantit/models/challenge.dart';
import 'package:plantit/models/user.dart';
import 'package:plantit/services/auth.dart';
import 'package:plantit/services/database.dart';
import 'package:plantit/utils/SizeHelper.dart';


class ChallengeTab extends StatefulWidget {
  @override
  _ChallengeTabState createState() => _ChallengeTabState();
}

class _ChallengeTabState extends State<ChallengeTab> {

  final AuthService _auth = AuthService();


  //PlaceHolder Challenges in the time in which the challenges are loaded
  Challenge activeDailyChallenge = Challenge('Daily Challenge', '\n', 50, 5, true, 0, -1);
  Challenge activeNonDailyChallenge = Challenge('', '', 50, 5, false, 0, -1);

  DataBaseService databaseService;

  @override
  void initState() {
    super.initState();
    loadChallenges();
  }

  //updates the active Challenges and refreshes the State -> Rebuild of the App
  Future<void> loadChallenges() async {
    User currentUser = await _auth.getCurrentUser();
    this.databaseService = DataBaseService(uid: currentUser.uid);

    await databaseService.updateActiveChallenges(); // wait for valid challenges

    Challenge activeDailyChallenge = await databaseService.getActiveDailyChallenge();
    Challenge activeNonDailyChallenge = await databaseService.getActiveNondailyChallenge();

    setState(() {
      this.activeDailyChallenge = activeDailyChallenge;
      this.activeNonDailyChallenge = activeNonDailyChallenge;
    });
  }

  Widget createStars(int rating) {
    Row row = Row(
      children: <Widget>[
        //Static Content includes title and one star
        Text("Schwierigkeit", style: TextStyle(fontSize: 15, fontFamily: "Montserrat"),),
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

    RaisedButton finishDailyButton = RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Color(0xff383838),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0)),
      child: Align(alignment: Alignment.bottomCenter, child: Text("Completed!", style: TextStyle(fontFamily: "Montserrat", fontSize: 16, color: Colors.white))),
      onPressed: () async {
        if (databaseService == null) {
          return;
        }

        Challenge currentDailyChallenge = await databaseService.getActiveDailyChallenge();
        await databaseService.addHistoryEntry(currentDailyChallenge);
        await databaseService.setActiveDailyChallenge(null);
        await loadChallenges();
        await databaseService.updateUserScore(await databaseService.getUserScore() + currentDailyChallenge.points); //adds the points to the current user score
      },
    );

    RaisedButton finishNondailyButton = RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Color(0xff48D997),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0)),
      child: Align(alignment: Alignment.bottomCenter, child: Text("Finished!", style: TextStyle(fontFamily: "Montserrat", fontSize: 16, color: Colors.white))),
      onPressed: () async {

        if (databaseService == null) {
          return;
        }

        Challenge currentNonDailyChallenge = await databaseService.getActiveNondailyChallenge();
        await databaseService.addHistoryEntry(currentNonDailyChallenge);
        await databaseService.setActiveNondailyChallenge(null);
        await loadChallenges();
        await databaseService.updateUserScore(await databaseService.getUserScore() + currentNonDailyChallenge.points);

      },
    );

    return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background/Left_MainTab.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: getDisplayWidth(context) * 0.075),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getDisplayHeight(context) * 0.05),
                  Text("Challenges", style: TextStyle(fontSize: 24, fontFamily: "Montserrat")),
                  SizedBox(height: getDisplayHeight(context) * 0.025),
                  Stack(
                    children: <Widget>[

                      Positioned(
                        right: 20,
                        bottom: 9,
                        child: SizedBox(
                          height: getDisplayHeight(context) * 0.05,
                          width: getDisplayWidth(context) * 0.5,
                          child: finishDailyButton
                        ),
                      ),

                      Container(
                        //height: getDisplayHeight(context) * 0.185,
                        height: getDisplayHeight(context) * 0.23,
                        width: getDisplayWidth(context) * 0.8,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        margin: EdgeInsets.only(bottom: getDisplayHeight(context) * 0.05),
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
                          children: <Widget>[
                            Text("Daily Challenge", style: TextStyle(fontSize: 21, fontFamily: "Montserrat"),),
                            SizedBox(height: 7.5),
                            Text(activeDailyChallenge.challengeText, style: TextStyle(fontSize: 15.5, fontFamily: "Montserrat-Light"),),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  child: createStars(activeDailyChallenge.rating),
                                ),

                                Text(activeDailyChallenge.points.toString() + " pts.", style: TextStyle(fontSize: 15, fontFamily: "Montserrat"),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: getDisplayHeight(context) * 0.02,),

                  Stack(
                    children: <Widget>[

                      Positioned(
                        left: 30,
                        bottom: 9,
                        child: SizedBox(
                          height: getDisplayHeight(context) * 0.05,
                          width: getDisplayWidth(context) * 0.4,
                          child: finishNondailyButton
                        ),
                      ),

                      Container(
                        height: getDisplayHeight(context) * 0.2,
                        width: getDisplayWidth(context) * 0.8,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: getDisplayHeight(context) * 0.05),
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
                          children: <Widget>[
                            Text(activeNonDailyChallenge.title, style: TextStyle(fontSize: 21, fontFamily: "Montserrat"),),
                            SizedBox(height: 7.5),
                            Text(activeNonDailyChallenge.challengeText, style: TextStyle(fontSize: 16.5, fontFamily: "Montserrat-Light"),),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      );
  }
}