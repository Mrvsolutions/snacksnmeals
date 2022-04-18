import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../AppToolbar.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var _titleheading = "Menu";
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppToolbar(context, _titleheading, true),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 60.0,
          items: <Widget>[
            Image.asset(
              "assets/ic_home.png",
              height: 20, width: 20,
              color: Colors.black87,
            ),
            Image.asset(
              "assets/ic_notification.png",
              height: 20, width: 20,
              color: Colors.black87,
            ),
            Image.asset(
              "assets/ic_cart.png",
              height: 20, width: 20,
              color: Colors.black87,
            ),
            // Icon(Icons.call_split, size: 30),
            Image.asset(
              "assets/ic_favorite.png",
              height: 20, width: 20,
              color: Colors.black87,
            ),
            Image.asset(
              "assets/ic_profile.png",
              height: 20, width: 20,
              color: Colors.black87,
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.orange,
          backgroundColor: Colors.green,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                // ElevatedButton(
                //   child: Text('Go To Page of index 1'),
                //   onPressed: () {
                //     final CurvedNavigationBarState? navBarState =
                //         _bottomNavigationKey.currentState;
                //     navBarState?.setPage(1);
                //   },
                // )
              ],
            ),
          ),
        ));
  }
}
