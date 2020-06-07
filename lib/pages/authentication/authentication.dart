/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:plantit/pages/authentication/Registration.dart';
import 'package:plantit/pages/authentication/Sign_In.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool showSignInScreen = true;

  //Switch between SignIn and Registering Form
  void switchView() {
    setState(() {
      showSignInScreen = !showSignInScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignInScreen) {
      return SignIn(switchView: switchView); //pass switchView Function
    } else {
      return Registration(switchView: switchView);
    }

  }
}
