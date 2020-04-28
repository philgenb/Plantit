import 'package:flutter/material.dart';
import 'pages/Homepage.dart';
import 'pages/ChallengeTab.dart';
import 'utils/SlideTransitions.dart';



class NavBar extends StatefulWidget {
  final int currindex;

  //NavBar({Key key, @required this.currindex}) : super(key: key);
  NavBar(this.currindex);

  @override
  _NavBarState createState() => _NavBarState(currindex);
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 1; //App startet im Home Fenster

  _NavBarState(this._selectedIndex); //Setzt den aktuell ausgewählten Index

  static const TextStyle selectedStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      if(index != _selectedIndex) {
        _selectedIndex = index;
      }
    });
  }

  //BOTTOM - NavigationBar
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 27.5,),
            title: Text('Challenge', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white, size: 27.5),
          title: Text('Home', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white,  size: 27.5),
          title: Text('History', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),),
        ),
      ],
        backgroundColor: Color(0xff3E3E3E),
        //backgroundColor: Color(0xff7BD396),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      );
  }
}