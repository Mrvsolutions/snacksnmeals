import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snacksnmeals/pages/CartPage.dart';
import 'package:snacksnmeals/pages/ProfilePage.dart';

import 'Comman/ColorFile.dart';

PreferredSize AppToolbar(
    BuildContext context, String _titleheading, bool _isVisibleBack,bool IsHideAllRightIcon) {
  bool _isVisible = true;
  bool _IsHideAllRightIcon = false;
  int selectedindix = 0;
  // if (_titleheading == "Add Party Room") {
  //   selectedindix = 1;
  // } else if (_titleheading == "Add Service Elevetor") {
  //   selectedindix = 2;
  // } else if (_titleheading.contains("My Profile") || _titleheading.contains("Change Password")) {
  //   selectedindix = 4;
  // }
  // if (_titleheading == "Party Room" ||
  //     _titleheading == "Service Elevetor" ||
  //     _titleheading.contains("Add") ||
  //     _titleheading.contains("Change") ||
  //     _titleheading.contains("My")) {
  //   _isVisible = true;
  // }
  //
  // if (_titleheading.contains("Add") ||
  //     _titleheading.contains("Change") ||
  //     _titleheading.contains("My")) {
  //   _IsHomeIconShow = true;
  // }
  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: AppBar(
      toolbarHeight: 80,
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Container(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 35,
                        child: Visibility(
                          visible: _isVisibleBack,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Image.asset(
                              "assets/ic_back.png",
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _titleheading,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: !_IsHideAllRightIcon,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Visibility(
                            visible: _isVisible,
                            child: InkWell(
                              onTap: () {
                                //    Navigator.of(context).pop(true);
                              },
                              child: Image.asset(
                                "assets/ic_search.png",
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Visibility(
                            visible: _isVisible,
                            child: InkWell(
                              onTap: () {
                                   Navigator.of(context).pop(true);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ));
                              },
                              child: Image.asset(
                                "assets/ic_cart.png",
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Visibility(
                            visible: _isVisible,
                            child: InkWell(
                              onTap: () {
                                //    Navigator.of(context).pop(true);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(),
                                    ));
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: profilebg,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage("assets/user_profile.png")),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      backgroundColor: Colors.white,
    ),
  );
}
