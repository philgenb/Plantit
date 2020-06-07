/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class NavItem {
  final String animationName;
  final double x;

  NavItem({this.animationName, this.x});
}



class NavBar extends StatefulWidget {
  Function(int) setActivePage;
  int currentActiveItemIndex;

  NavBar({this.currentActiveItemIndex, this.setActivePage});

  @override
  _NavBarState createState() => _NavBarState(currentActiveItemIndex);
}

class _NavBarState extends State<NavBar> {

  NavItem activeNavItem;

  _NavBarState(currentActiveItemIndex) {
    activeNavItem = navItems[currentActiveItemIndex];
  }

  //Items of the Buttomnavigation bar sorted by x-position
  final List navItems = [
    NavItem(x: -1, animationName: "challengetab_bar"),
    NavItem(x: 0, animationName: "hometab_bar"),
    NavItem(x: 1, animationName: "historytab_bar")
  ];


  @override
  void initState() {
    super.initState();
    //activeNavItem = navitems[1];
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80,
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: navItems.map<Widget>((item) { //Maps Widget to NavItems -> Builds up Buttom NavBar with Animations
            return Container(child: _flare(item), margin: EdgeInsets.symmetric(horizontal: 5),);
          }).toList(),
        ),
      ),
    );

  }

  Widget _flare(NavItem item) {
    return GestureDetector( //Responds to Tap -> Changes the currentActive Nav Item
      child: AspectRatio(
        aspectRatio: 1,
        child: FlareActor(
          'assets/animations/${item.animationName}.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          //If the Item is the current active Animationname, Size will increase ; Otherwise decrease
          animation: item.animationName == activeNavItem.animationName ? 'increase' : 'decrease',
        ),
      ),
      onTap: () {
        //Current Active NavItem is Updated ; animates to page that corresponds to the Item
        setState(() {
          activeNavItem = item;
        });
        widget.setActivePage(navItems.indexOf(item));
      },
    );
  }

}

