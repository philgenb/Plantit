import 'package:flutter/material.dart';

class IntroSlide2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/intro/02_appintro.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      margin: new EdgeInsets.only(left: 40, top: 200, right: 40),
                      height: 225,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(
                          color: Color(0xffDCDCDC),
                          offset: Offset(15, 10,),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        )]
                      )
                  ,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('"Lorem ipsum dolor sit amet\nconsetetur sadipscing elitr,\nsed diam nonumy!"',
                            style: TextStyle(fontSize: 17, color: Color(0xff3E3E3E), fontFamily: 'Montserrat')),
                          Text("~Aaron Birk",
                              style: TextStyle(fontSize: 19, color: Color(0xff3E3E3E), fontFamily: 'Montserrat-Light')),
                        ],
                      )

                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                        onPressed: () {  },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: Color(0xff292929),
                        child: Text("Mehr!", style: TextStyle(fontSize: 19, color: Colors.white, fontFamily: 'Montserrat')),
                      ))
                ],
              )
          ),)
    );
  }
}