/*
* All rights reserved ~ ©Samir Yasin
*/

import 'package:flutter/material.dart';
import 'package:plantit/pages/CreditsAndFAQ/FAQItem.dart';
import 'package:plantit/utils/SizeHelper.dart';

class DetailsPage extends StatelessWidget {


  FAQItem faqItem;
  DetailsPage(FAQItem faqitem) {
    this.faqItem = faqitem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text('PlantIt'), backgroundColor: Colors.lightGreen,),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background/Mid_MainTab.png"),
                  fit: BoxFit.fill,
                )),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Container(
                  height: getDisplayHeight(context) * 0.075, //Responsive Height linked to Diplay Height
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(7.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(23.00),
                  ),
                  child: Center(
                    child: Text(
                      faqItem.question,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Text (
                  faqItem.answer,style: TextStyle(
                  fontFamily: 'Montserratlight',
                  fontSize: 17,),
                )
              ]),
            ),
          ));
  }
}
