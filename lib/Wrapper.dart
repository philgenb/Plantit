/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:plantit/HomePageView.dart';
import 'package:plantit/models/user.dart';
import 'package:plantit/pages/authentication/authentication.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  /*
      All rights reserved ~ ©Phil Gengenbach
   */

  static const routeName = '/Wrapper';

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //Checks whether User is already Signed in
    if(user == null) { //no User Logged In -> Call authentication Widget
      return Authentication(); //SignIn or Registration Widget
    } else {
      //User Logged In -> HomeScreen
      print("User Logged In:");
      print(user.uid);
      return Home();
    }

  }
}
