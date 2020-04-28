import 'package:flutter/material.dart';
import 'package:plantit/pages/settings/SettingsUIElements.dart';
import 'package:plantit/services/auth.dart';

class Settings extends StatelessWidget {

  final AuthService _auth = AuthService(); //Auth Service -> SignOut / Account Settings

  static const routeName = '/SettingsTab';

  @override
  Widget build(BuildContext context) {
   var mediaQuery = MediaQuery.of(context);
   double deviceheight = mediaQuery.size.height;
   double devicewidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(title: Text('PlantIt'), backgroundColor: Colors.lightGreen,),
      body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background/Left_MainTab.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: devicewidth * 0.09, right: devicewidth * 0.09, top: deviceheight * 0.07),
                  height: deviceheight * 0.6,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: devicewidth*0.03),
                          child: Text("Settings",  style: TextStyle(fontSize: 24, color: Color(0xff3E3E3E), fontFamily: 'Montserrat'))),
                      Expanded(
                        child: SizedBox.expand(
                          child: Container(
                            padding: EdgeInsets.only(left: devicewidth*0.03),
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(7.00,3.00),
                                    color: Color(0xff000000).withOpacity(0.16),
                                    blurRadius: 5,
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SettingsUIElements().getSettingHeadline("Account", mediaQuery),
                                SettingsUIElements().getSettingButton("Account wechseln", mediaQuery, () {}),
                                SettingsUIElements().getSettingButton("Abmelden", mediaQuery, () async {
                                  await _auth.signOut(); //SignOut
                                  Navigator.pop(context);
                                }),

                                Padding(
                                  padding: EdgeInsets.only(top: deviceheight * 0.05),
                                  child: SettingsUIElements().getSettingHeadline("Settings", mediaQuery)
                                ),
                                SettingsUIElements().getSettingButton("Musik", mediaQuery, () {}),
                                SettingsUIElements().getSettingButton("Sound", mediaQuery, () {}),
                                SettingsUIElements().getSettingButton("Sprache", mediaQuery, () {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}
