/*
* All rights reserved ~ ©Samir Yasin
*/

import 'package:flutter/material.dart';
import 'package:plantit/pages/CreditsAndFAQ/CreditsPage.dart';
import 'package:plantit/pages/CreditsAndFAQ/FAQItem.dart';
import 'package:plantit/pages/CreditsAndFAQ/DetailsPage.dart';


class FAQTab extends StatelessWidget {

  static const routeName = '/FAQTab';

  List<FAQItem> faqitems = [
    FAQItem("How Do I Make My Tree Grow?",
        "In order to grow your tree you need to complete Active and Daily Missions. By completing these Missions you achieve a certain amount of Score. The higher the Score the bigger the Tree."),
    FAQItem("How Many Points Do Missions Grant You?",
        "The Score is higher depending on the difficulty of the completed Missions. The harder the Mission the higher the Score. There are 5 difficulty levels each adding an additional 10 Score. Maximum of 50 Score for 5 Star Missions"),
    FAQItem("What Happens If I dont complete the Missions?",
        "Your old daily Mission will be deleted and you will be assigned a new daily Mission. The active Missions stay untill you complete them."),
    FAQItem("Is This App The Best App of the World ?",
        "Yes this is one of the best Apps in the world! It spreads positivity and helps you better yourself. What more could you ask for!"),
    FAQItem("Who developed this App?",
        "To find out click the Credits button in the bottom right corner"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
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
          child: FloatingActionButton.extended(
            label: Text(
              "Credits",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            icon: Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreditsPage()));
            },
            backgroundColor: Colors.white,
          ),
        ),
        appBar: AppBar(title: Text('PlantIt'), backgroundColor: Colors.lightGreen,),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background/Mid_MainTab.png"),
                fit: BoxFit.fill,
              )),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Text("FAQ",
                        style: TextStyle(fontSize: 28, fontFamily: 'Montserrat')),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: faqitems.length,
                      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 15,),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.00),
                          //color: Colors.white,
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
                          child: ListTile(
                              leading: ImageIcon(
                                Image.asset('assets/images/question.png').image,
                                color: Color(0xff484848),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right, color: Color(0xff484848), size: 30,),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(faqitems[index])));
                              },
                              title: Text(
                                faqitems[index].question,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff484848),
                                  fontFamily: 'Montserrat'
                                ),
                                textAlign: TextAlign.center,
                              )),
                        );
                      },
                    ),
                  )
            ]),
          ),
        ));
  }
}
