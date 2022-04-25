import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snacksnmeals/Comman/ColorFile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: PageBackground,
        child: Column(
          children: [
            ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                //your widget items here
              ],
            ),
          ],
        ),
      ),
    );
  }
}
