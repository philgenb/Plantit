import 'package:flutter/material.dart';
import 'package:plantit/HomePageView.dart';
import 'package:plantit/models/user.dart';
import 'package:plantit/pages/authentication/authentication.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  static const routeName = '/Wrapper';

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //Check Whether User is Already Signed in
    if(user == null) { //No User Logged In -> Call Authentification Widget
      return Authentication();
    } else {
      //User Logged In -> HomeScreen
      print("User Logged In:");
      print(user.uid);
      return HomePageView();
    }

  }
}
