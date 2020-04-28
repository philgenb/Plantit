import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class NavItem {
  final String animationname;
  final double x;

  NavItem({this.animationname, this.x});
}



class NavBar2 extends StatefulWidget {
  int currentactiveitemindex;

  NavBar2(this.currentactiveitemindex);

  @override
  _NavBar2State createState() => _NavBar2State(currentactiveitemindex);
}

class _NavBar2State extends State<NavBar2> {

  NavItem activeNavItem;

  _NavBar2State(currentactiveitemindex) {
    activeNavItem = navitems[currentactiveitemindex];
  }

  //Items für untere Navigation Bar
  List navitems = [
    NavItem(x: -1, animationname: "challengetab_bar"),
    NavItem(x: 0, animationname: "hometab_bar"),
    NavItem(x: 1, animationname: "historytab_bar")
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
          children: navitems.map<Widget>((item) {
            return Container(child: _flare(item), margin: EdgeInsets.symmetric(horizontal: 5),);
          }).toList(),
        ),
      ),
    );

    /*
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80,
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: navitems.map<Widget>((item) {
                  return _flare(item);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );

     */
  }

  Widget _flare(NavItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: FlareActor(
          'assets/animations/${item.animationname}.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: item.animationname == activeNavItem.animationname ? 'increase' : 'decrease',
        ),
      ),
      onTap: () {
        setState(() {
          activeNavItem = item;
        });
      },
    );
  }

}

