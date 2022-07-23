import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snacksnmeals/pages/MainHomePage.dart';
import 'package:snacksnmeals/pages/SignupMainPage.dart';

import 'Comman/string.dart';

Future main() async {
  String  _loginStatus = "";
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  _loginStatus = preferences.getString("message")?? "";
  // runApp(const MyApp());
  runApp(MaterialApp(
    title: "Snack N Meals",
    home: MyApp(_loginStatus),
    // home: (_loginStatus == LOGIN_COMPLETE)? HomePages(): LoginPage()
  ));
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
  String logined;
  MyApp(this.logined);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ( widget.logined == LOGIN_COMPLETE)? MainHomePage(0): SignupMainPage()
    ],);
  }
}
