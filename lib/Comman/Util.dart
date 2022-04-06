import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

void EasyLoadingToastMessage(BuildContext context, String strmsg) {
  // final scaffold = ScaffoldMessenger.of(context);
  // scaffold.showSnackBar(
  //     SnackBar(
  //       content: Text(strmsg),
  //     ));
  EasyLoading.showToast(strmsg,toastPosition: EasyLoadingToastPosition.bottom);
}
void CustomeSnackBarMessage(BuildContext context, String strmsg) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
      SnackBar(
        content: Text(strmsg),
      ));
}
void CustomeFlutterToast(String strmsg) {
  Fluttertoast.showToast(
      msg: strmsg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0
  );
}



