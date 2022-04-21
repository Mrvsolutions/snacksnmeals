import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

PreferredSize AppToolbar(
    BuildContext context, String _titleheading, bool _isVisibleBack) {
  bool _isVisible = true;
  bool _IsHomeIconShow = false;
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
    preferredSize: Size.fromHeight(50.0),
    child: AppBar(
      toolbarHeight: 50,
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
                Row(
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
                              //    Navigator.of(context).pop(true);
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
                  ],
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
