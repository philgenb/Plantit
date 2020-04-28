import 'package:flutter/material.dart';


class IntroSlide1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/intro/01_appintro.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child: Container(
                  margin: new EdgeInsets.fromLTRB(30, 140, 30, 30),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Plantit",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38, color: Color(0xff3E3E3E), fontFamily: 'Montserrat')
                      ),
                      Text("Jeden Tag eine gute Tat!\nGeht nicht? Klar! Wir helfen dir\ndabei. Lass uns beginnen.",
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: Color(0xff3E3E3E), fontFamily: 'MontserratLight'),
                      ),
                    ],
                  )

              )
          ),)
    );
  }
}

