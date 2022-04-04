import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BgImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red.withOpacity(0.9),
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/bg_img.jpeg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
         // color: Colors.red.withOpacity(0.9),
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }
}
