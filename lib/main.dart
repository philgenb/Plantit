/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantit/Wrapper.dart';
import 'package:plantit/models/user.dart';
import 'package:plantit/pages/CreditsAndFAQ/DetailsPage.dart';
import 'package:plantit/pages/CreditsAndFAQ/FAQTab.dart';
import 'package:plantit/pages/settings/Settings.dart';
import 'package:plantit/services/auth.dart';
import 'pages/ChallengeTab.dart';
import 'HomePageView.dart';
import 'pages/Intro/IntroPageView.dart';
import 'package:provider/provider.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) { //App only in portrait mode
      runApp(MyApp());
    });

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyIntroView(),
        routes: {
          //Routes for Screen Navigation within the program; Routing names are stored witin the classes
          HomePageView.routeName: (context) => HomePageView(),
          Wrapper.routeName: (context) => Wrapper(),
          Settings.routeName: (context) => Settings(),
          FAQTab.routeName: (context) => FAQTab(),

        },
      ),
    );
  }
}

