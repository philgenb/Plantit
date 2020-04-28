import 'package:flutter/material.dart';
import 'file:///C:/Users/Phil/Documents/AppProjekte/plantit/plantit/lib/utils/TopAppBar.dart';
import '../BottomNavBar.dart';
import 'file:///C:/Users/Phil/Documents/AppProjekte/plantit/plantit/lib/utils/ButtomNavBar2.dart';
import 'package:plantit/utils/SizeHelper.dart';

class ChallengeTab extends StatelessWidget {
  static const routeName = '/ChallengeTab';
/*
  int BarIndex;

  ChallengeTab(int currentBottomBarIndex) {
    BarIndex = currentBottomBarIndex;
  }
  */

  @override
  Widget build(BuildContext context) {
    //final int BarIndex = ModalRoute.of(context).settings.arguments;
    final int BarIndex = 0;

    return Scaffold(
        appBar: TopAppBar().getAppBar(context),
        body: SizedBox.expand(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background/Left_MainTab.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child: Stack(
                children: <Widget>[
                   Align(
                     alignment: Alignment(0, -0.25),
                     child: Container(
                      height: getDisplayHeight(context) * 0.275,
                      width: getDisplayWidth(context) * 0.75,
                      padding: EdgeInsets.all(20),
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
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           //TODO ONLY SHOW IF THERE IS A NEW CHALLENGE
                           Text("New Challenge arrived!", style: TextStyle(fontSize: 23, fontFamily: "Montserrat"),),
                           Align(
                             alignment: Alignment.bottomRight,
                             child: FlatButton(
                                 color: Color(0xff525252),
                                 textColor: Colors.white,
                                 padding: EdgeInsets.symmetric(vertical: getDisplayHeight(context) * 0.015, horizontal: getDisplayWidth(context) * 0.075),
                                 shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16)),
                                 onPressed: () {

                                 },
                                 child: Text("Check it out!", style: TextStyle(fontSize: 16, fontFamily: "Montserrat")),
                             ),
                           )
                         ],
                       ),
                  ),
                   ),

                  NavBar2(BarIndex)
                ],
              ),
              )
          ),
    );
  }
}