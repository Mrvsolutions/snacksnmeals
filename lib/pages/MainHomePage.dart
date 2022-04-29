import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snacksnmeals/Comman/ColorFile.dart';
import 'package:snacksnmeals/pages/HomeScreen.dart';

import '../AppToolbar.dart';

class MainHomePage extends StatefulWidget {
  int _page;

  MainHomePage(@required this._page);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<String> titleList = [
    "Good Meal",
    "Notification",
    "Cart",
    "Favorite",
    "Profile"
  ];
  late String _titleheading;
  final _widgetOptions = [
    new HomeScreen(),
    new HomeScreen(),
    new HomeScreen(),
    new HomeScreen(),
    new HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget._page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _titleheading = titleList[widget._page];
    return Scaffold(
        appBar: AppToolbar(context, _titleheading, true),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: widget._page,
          height: 60.0,
          items: <Widget>[
            Image.asset(
              "assets/ic_home.png",
              height: 20,
              width: 20,
              color: BlackColor,
            ),
            Image.asset(
              "assets/ic_notification.png",
              height: 20,
              width: 20,
              color: BlackColor,
            ),
            Image.asset(
              "assets/ic_cart.png",
              height: 20,
              width: 20,
              color: BlackColor,
            ),
            // Icon(Icons.call_split, size: 30),
            Image.asset(
              "assets/ic_favorite.png",
              height: 20,
              width: 20,
              color: BlackColor,
            ),
            Image.asset(
              "assets/ic_profile.png",
              height: 20,
              width: 20,
              color: BlackColor,
            ),
          ],
          color: WhiteColor,
          buttonBackgroundColor: bgOrangeColor,
          backgroundColor: PageBackground,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          onTap: _onItemTapped,
          letIndexChange: (index) => true,
        ),
        body: Center(
          child: _widgetOptions.elementAt(widget._page),
        ));
  }
}
