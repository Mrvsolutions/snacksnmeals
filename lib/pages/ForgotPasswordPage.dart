import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:snacksnmeals/Comman/ForgotDialogPage.dart';
import 'package:snacksnmeals/Comman/string.dart';

import '../AppToolbar.dart';
// import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var _titleheading = "Forgot Password?";

  // String UserID,username;
  TextEditingController _emailController = new TextEditingController();
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  GetSharePrefrenceValue();
  }

  // Future GetSharePrefrenceValue() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   UserID = preferences.getString(Register_UserID);
  //   username = preferences.getString(StrUserName);
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
        appBar: AppToolbar(context, _titleheading, true, true),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: Text(
                      "Please write your email to receive a confirmation code to set a new password.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return StrEnterEmailId;
                          } else if (value.isNotEmpty && !reg.hasMatch(value)) {
                            return StrEnterValidEmailId;
                          }
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          focusColor: Colors.orange,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          hintText: "Enter E-Mail", labelText: "E-Mail"),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        if (_emailController.text.isNotEmpty) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          EditProfileRequest(_emailController.text);
                        }
                      },
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                      color: Colors.orange,
                      textColor: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void EditProfileRequest(StrEmail) async {
    EasyLoading.show(status: 'Please Wait...');
    // Map data = {
    //   // 'residence_user_id': UserID,
    //   // 'resident_name': username,
    //   'resident_email': StrEmail,
    // };
    // print(data.toString());
    // var url = Uri.parse(ForgotPassWordAPI);
    // http.Response response = await http.post(
    //   url,
    //   body: data,
    //   headers: {
    //     "Accept": "application/json",
    //   },
    // );

   // if (response.statusCode == 200) {
  //    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  //    if (jsonResponse != null) {
        EasyLoading.dismiss();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ForgotDialogPage(StrEmail);
            });
   //   }
 //   } else {
  //    EasyLoading.dismiss();
 //     print(response.body);
 //   }
  }
}
