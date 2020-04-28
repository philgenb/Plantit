import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantit/services/auth.dart';
import 'package:plantit/shared/Loading.dart';

/*
    Anmeldungsscreen -> ermöglicht die Anmeldung Anonym oder auch Accountgebunden
 */

class SignIn extends StatefulWidget {

  final Function switchView;

  SignIn({this.switchView});

  @override
  _SignInState createState() => _SignInState();
}



class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formInputKey = GlobalKey<FormState>();

  bool loading = false;

  //Local TextField Variables
  String email = "";
  String password = "";
  String error;
  //------------------------

  Widget getErrorWidget() {
    if(error != null) {
      return Text(error, style: TextStyle(fontFamily: "Montserrat-light", color: Colors.red),);
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double deviceheight = mediaQuery.size.height;
    double devicewidth = mediaQuery.size.width;

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Color(0xff454545));

    // --------- CONTAINER ------------------

    final emailField = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(7.00,3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(23.00),
      ),
      child: TextFormField(
        validator: (String input) {
          if(!input.isEmpty) {
            return null;
          } else {
            return "Please Enter an E-Mail!";
          }
        },
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "E-Mail",
            fillColor: Colors.white,
            border: InputBorder.none),
        onChanged: (input) {
          setState(() {
            email = input;
          });
        },
      ),
    );

    final passwordField = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(7.00,3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(23.00),
      ),
      child: TextFormField(
        validator: (String password) {
          if(password.length >= 6) {
            return null;
          } else {
            return "Invalid Password";
          }
        },
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              fillColor: Colors.white,
              border: InputBorder.none),
        onChanged: (String input) {
          setState(() {
            password = input;
          });
        },
      ),
    );

    final loginButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff80F09A),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async{
          if(_formInputKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            dynamic result = await _auth.LoginWithEmailAndPassword(email, password);
            if(result == null) {
              setState(() {
                loading = false;
                error = "Incorrect E-Mail or Password!";
              });
            }
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final continueAnonymousButton = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(7.00,3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(16.00),
    ),
      child: FlatButton(
        child: Text("Continue without an account",
            style: TextStyle(
                fontFamily: "Montserrat-Light",
                fontSize: 14,
                color: Color(0xff454545))),
        onPressed: () async {
          dynamic result = await _auth.signInAnonym();
          if (result == null) {
            print("ERROR: Couldn't Sign in");
          } else {
            print("Signed In");
            print(result.uid);
          }
        },
      ),
    );

    //---------------------------------------------------------


    if(loading == true) {
      return Loading();
    } else {
      return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SizedBox.expand(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/background/Left_MainTab.png"),
                      fit: BoxFit.fill,
                    )
                ),
                child: Container(
                  //color: Colors.grey,
                  margin: EdgeInsets.only(left: devicewidth * 0.09, right: devicewidth * 0.09, top: deviceheight * 0.125),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Login", style: TextStyle(fontSize: 30, color: Color(0xff3E3E3E), fontFamily: 'Montserrat')),
                      SizedBox(height: 35.0),

                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: devicewidth * 0.05),
                            padding: EdgeInsets.only(top: deviceheight * 0.0125),
                            height: devicewidth*0.15,
                            width: devicewidth * 0.6,
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color: Color(0xff383838),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(7.00,3.00),
                                  color: Color(0xff000000).withOpacity(0.16),
                                  blurRadius: 5,
                                ),
                              ], borderRadius: BorderRadius.circular(18.00),
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                color:Color(0xffffffff),
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: devicewidth * 0.04),
                            margin: EdgeInsets.only(top: deviceheight * 0.05),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(7.00, 3.00),
                                    color: Color(0xff000000).withOpacity(0.16),
                                    blurRadius: 5,
                                  ),
                                ]
                            ),
                            child: Form(
                              key: _formInputKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 30.0),
                                  emailField,
                                  SizedBox(height: 15.0),
                                  passwordField,
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  loginButton,
                                  SizedBox(
                                    height: 15.0,
                                  ),

                                  getErrorWidget(),

                                  FlatButton(
                                    child: Text("Don’t have an account? Sign Up", style: TextStyle(fontFamily: "Montserrat-light", color: Color(0xff383838))),
                                    onPressed: () {
                                      widget.switchView();
                                    },
                                  )

                                  //

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),


                      SizedBox(
                        height: 15.0,
                      ),

                      continueAnonymousButton
                    ],
                  ),
                ),
              )
          ));
    }



  }
}
