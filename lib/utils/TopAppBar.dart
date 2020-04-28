import 'package:flutter/material.dart';
import 'package:plantit/pages/settings/Settings.dart';

class TopAppBar {

  AppBar getAppBar(context) {
    return AppBar(
      title: Text('PlantIt'),
      backgroundColor: Colors.lightGreen,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: GestureDetector(
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30,
            ),
            onTap: () {
              Navigator.pushNamed(context, Settings.routeName);
            },
          ),
        ),
      ],
    );
  }


}


