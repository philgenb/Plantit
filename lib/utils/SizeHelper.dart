/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';


  Size displaySize (BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double getDisplayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getDisplayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
