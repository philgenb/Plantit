/*
* All rights reserved ~ ©Samir Yasin
*/

import 'package:flutter/material.dart';

class CreditsPage extends StatefulWidget {
  @override
  CreditsPageState createState() => CreditsPageState();
}

class CreditsPageState extends State<CreditsPage> {

  // Offset is 3, By knowing the Offset we only need to program the Decryption. Original Text "This app is developed by Phil Gengenbach and Samir Yasin"
  String creditText = "Wklv#dss#lv#ghyhorshg#e|#Sklo#Jhqjhqedfk#dqg#Vdplu#\\dvlq";
  String klarText; //placeholder for the decrypted text
  bool decrypted = false; //initalized with false


  decrypt () {
   if(decrypted == false) { //Only If Text is encrypted

     int offset = -3; //Key inverted to decode

     klarText = "";

     for (int i = 0; i < creditText.length; i++) { //iterates through the whole String, char by char
       int oldchar = creditText.codeUnitAt(i); //ASCII of old Char
       int decodedCharASCII = oldchar + offset; //ASCII of decripted Char
       var newchar = String.fromCharCode(decodedCharASCII); //Convert ASCII-int to String that holds one char

       klarText += newchar; //add decryptedChar to klarText
   }
     //sets the new state -> Calls Build Method -> UI is rebuild
     setState(() {
       this.decrypted = true;
       this.creditText = klarText;
     });
   }

 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Credits'), backgroundColor: Colors.lightGreen,),
        floatingActionButton: FloatingActionButton.extended (
            backgroundColor: Color(0xff3E3E3E),
            onPressed: () {
              decrypt();
            },
            label: ImageIcon(
              Image.asset('assets/images/encrypt.png').image,
              size: 35,
              color: Colors.white,
            )
        ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
              child: Text(creditText, style: TextStyle(fontFamily: 'Montserrat', fontSize: 20), textAlign: TextAlign.center,))
      ),


      );
  }
}


