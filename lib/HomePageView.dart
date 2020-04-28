import 'package:flutter/material.dart';
import 'pages/Homepage.dart';
import 'pages/ChallengeTab.dart';
import 'pages/HistoryTab.dart';




class HomePageView extends StatelessWidget {

  static const routeName = '/HomeTab';

  int selectedItem = 1;

  final List<Widget> pages=[ChallengeTab(), Homepage(), HistoryTab()];

  void pageWasChanged(int index) {
    selectedItem = index;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: PageController(initialPage: 1),
        itemCount: pages.length,
        itemBuilder: (context, position) => pages[position],
        onPageChanged: (index) { pageWasChanged(index); },
      );
  }
}


