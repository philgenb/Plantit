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
  String klarText;
  bool decrypted = false;

  decrypt () {
   if(decrypted == false) { //Only If Text is encrypted

     int offset = -3; //Key inverted to decode

     klarText = "";

     for (int i = 0; i < creditText.length; i++) {
       int oldchar = creditText.codeUnitAt(i);
       print(oldchar);
       print("--");
       int decodedCharASCII = oldchar + offset;
       var newchar = String.fromCharCode(decodedCharASCII); //Convert ASCII int that represents char to Char
       print(decodedCharASCII);

       klarText += newchar; //add decrytpedChar to klartext
     }
     setState(() {
       this.decrypted = true;
       this.creditText = klarText;
     });
   }

 } // Decryption with the key as -3 , this will show the original text



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


