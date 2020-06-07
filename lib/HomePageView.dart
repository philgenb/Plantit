/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:plantit/utils/ButtomNavBar.dart';
import 'package:plantit/utils/TopAppBar.dart';
import 'pages/HomeTab.dart';
import 'pages/ChallengeTab.dart';
import 'pages/HistoryTab.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar that overlays the background
      appBar: TopAppBar().getAppBar(context),
      body: HomePageView(),
    );
  }
}




class HomePageView extends StatefulWidget {

  //Routing Name
  static const routeName = '/HomeTab';

  @override
  _HomePageViewState createState() => _HomePageViewState();
}



class _HomePageViewState extends State<HomePageView> {

  final PageController pageController = PageController(initialPage: 1);

  int selectedItem = 1; //index der ButtomNavigationBar -> Icon is highlighted

  //pageView Elements, includes the three main Pages: ChallengeTab, HomeTab and HistoryTab
  final List<Widget> pages=[ChallengeTab(), HomeTab(), HistoryTab()];

  //changes the current Itemindex and animates to the handed Page
  void setActivePage(int index) {
    setState(() {
      selectedItem = index;
    });
    changeToPage(index);
    //print(selectedItem);
  }


  void changeToPage(int index) {
    pageController.animateToPage(selectedItem, duration: Duration(milliseconds: 150), curve: Curves.ease);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        PageView.builder(
          controller: pageController,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: pages.length,
          itemBuilder: (context, position) => pages[position],
          onPageChanged: (int index) {
            //Index is updated when page changes
            setActivePage(index);
          },
        ),

        //Navigation Bar; Overlaps PageView; Positioned on the ButtomCenter of the Screen
        NavBar(currentActiveItemIndex: selectedItem, setActivePage: setActivePage),
      ],
    );
  }
}


