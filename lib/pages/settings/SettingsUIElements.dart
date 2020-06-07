/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'dart:ui';
import 'package:flutter/material.dart';

class SettingsUIElements {

  /*
      outsourced Helping UI-Class for Settings Menu
   */

  SizedBox getSettingButton(String buttonText, var mediaQuery, var onpressed) {
    double deviceWidth = mediaQuery.size.width;

    return SizedBox(
      width: deviceWidth * 0.75,
      child: RaisedButton(
        elevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
        onPressed: onpressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        color: Color(0xffF4F4F4),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(buttonText, style: TextStyle(fontSize: 14, color: Color(0xff454545), fontFamily: 'Montserrat'))),
      ),
    );
  }

  Container getSettingHeadline(String headlinetext, mediaQuery) {
    double deviceheight = mediaQuery.size.height;
    double devicewidth = mediaQuery.size.width;

    return Container(
      height: deviceheight * 0.055,
      width: devicewidth * 0.55,
      margin: EdgeInsets.only(bottom: 7.5),
      padding: EdgeInsets.only(left: 25),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(11),
        color: Color(0xff292929),
        boxShadow: [
          BoxShadow(
            offset: Offset(7.00,3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 5,
          ),
        ],
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(headlinetext, style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Montserrat'))),
    );
  }

  Container getTest(String headlinetext, mediaQuery) {
    double deviceheight = mediaQuery.size.height;
    double devicewidth = mediaQuery.size.width;

    new Container(
      height: 29.00,
      width: 248.00,
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00,3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 6,
          ),
        ], borderRadius: BorderRadius.circular(7.00),
      ),
    );
  }






}