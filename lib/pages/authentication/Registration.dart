import 'package:flutter/material.dart';
import 'package:plantit/services/auth.dart';
import 'package:plantit/shared/Loading.dart';

class Registration extends StatefulWidget {
  final Function switchView;

  Registration({this.switchView});

  @override
  _RegistrationState createState() => _RegistrationState();
}




class _RegistrationState extends State<Registration> {

  final AuthService _auth = AuthService();
  final _formInputKey = GlobalKey<FormState>();

  bool loading = false;

  // -- Local Text Field Variables --------
  String username = "";
  String email = "";
  String password = "";
  String repeatpassword = "";
  String error = "";
  //--------------------------------

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double deviceheight = mediaQuery.size.height;
    double devicewidth = mediaQuery.size.width;

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Color(0xff454545));


    // --------- UI ELEMENTS ------------------

    final usernameField = Container(
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
            return "Please Enter an Username";
          }
        },
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Username",
            fillColor: Colors.white,
            border: InputBorder.none),
        onChanged: (input) {
          setState(() {
            username = input;
          });
        },
      ),
    );

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
            return "You're Password have to be at least 4 Chars!";
          }
        },
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            fillColor: Colors.white,
            border: InputBorder.none),
        onChanged: (input) {
          setState(() {
            password = input;
          });
        },
      ),
    );

    final repeatpasswordField = Container(
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
          if(password == repeatpassword) {
            return null;
          } else {
            return "You have to enter the same Password twice!";
          }
        },
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Repeat Password",
            fillColor: Colors.white,
            border: InputBorder.none),
        onChanged: (input) {
          setState(() {
            repeatpassword = input;
          });
        },
      ),
    );

    final registerButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff80F09A),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if(_formInputKey.currentState.validate()) {
            loading = true;
            print(email);
            print(password.length);
            dynamic result = await _auth.RegisterWithEmailAndPassword(email, password, username);
            if(result == null) {
              setState(() {
                loading = false;
                error = "Please enter a valid E-Mail and Password!";
              });
            }
          }
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
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
                      //Text("Register", style: TextStyle(fontSize: 30, color: Color(0xff3E3E3E), fontFamily: 'Montserrat')),
                      SizedBox(height: 35.0),

                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: devicewidth * 0.15),
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
                              "Registration",
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
                                  usernameField,
                                  SizedBox(height: 15.0),
                                  emailField,
                                  SizedBox(height: 25.0),
                                  passwordField,
                                  SizedBox(height: 15.0),
                                  repeatpasswordField,
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  registerButton,
                                  SizedBox(height: 12,),
                                  Text(error, style: TextStyle(color: Colors.red, fontFamily: "Montserrat-light"),),
                                  //SizedBox(height: 15.0),



                                  FlatButton(
                                    child: Text("Already have an account? Sign Up", style: TextStyle(fontFamily: "Montserrat-light", color: Color(0xff383838))),
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


                    ],
                  ),
                ),
              )
          ));
    }

  }
}