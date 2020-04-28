import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantit/Wrapper.dart';
import 'package:plantit/models/user.dart';
import 'package:plantit/pages/settings/Settings.dart';
import 'package:plantit/services/auth.dart';
import 'pages/ChallengeTab.dart';
import 'HomePageView.dart';
import 'pages/Intro/IntroPageView.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) { //APP NUR IM PORTRAIT-MODUS VERFÜGBAR
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
          HomePageView.routeName: (context) => HomePageView(),
          ChallengeTab.routeName: (context) => ChallengeTab(),
          Wrapper.routeName: (context) => Wrapper(),
          Settings.routeName: (context) => Settings(),
        },
      ),
    );
  }
}

