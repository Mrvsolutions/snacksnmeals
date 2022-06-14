import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snacksnmeals/Comman/Util.dart';
import 'package:snacksnmeals/Comman/string.dart';
import 'package:snacksnmeals/api/api.dart';
import 'package:snacksnmeals/pages/CreateAccountPage.dart';
import 'package:snacksnmeals/pages/MainHomePage.dart';
import 'package:http/http.dart' as http;
import '../BgImage.dart';
import 'ForgotPasswordPage.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController UsernameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    PasswordController.clear();
    UsernameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.orange.withOpacity(0.9),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              BgImage(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: Card(
                      margin: const EdgeInsets.all(0.0),
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5), bottom: Radius.zero),
                      ),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30.0, 30, 0, 0),
                              child: Text(
                                "Let's Start Making \nGOOD MEALS",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Form(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(30.20, 30, 0, 30),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  cursorColor: Colors.orange,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: UsernameController,
                                  validator: (String? value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return StrEnterEmailId;
                                      } else if (value.isNotEmpty &&
                                          !reg.hasMatch(value)) {
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
                                    hintText: "Enter E-Mail",
                                    labelText:
                                        "E-Mail", //errorText:  isValidateEmail ? EmailErrorMsg : null
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  cursorColor: Colors.orange,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (String? value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return StrEnterPassword;
                                      }
                                    }
                                    return null;
                                  },
                                  controller: PasswordController,
                                  decoration: InputDecoration(
                                    focusColor: Colors.orange,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange),
                                    ),
                                    hintText: "Enter Password",
                                    labelText: "Password",
                                  ),
                                  obscureText: true,
                                ),
                              ],
                            ),
                          )),
                          FlatButton(
                            onPressed: () {
                              //TODO FORGOT PASSWORD SCREEN GOES HERE
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage()),
                              );
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password?",
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: RaisedButton(
                                onPressed: () {
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                                    currentFocus.focusedChild!.unfocus();
                                  }
                                  if (SignInValidation()) {
                                    signIn(UsernameController.text,
                                        PasswordController.text, context);
                                  }
                                },
                                child: Text("LOGIN"),
                                color: Colors.orange,
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          new TextSpan(
                              text: ' Sign up',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Single tapped.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateAccountPage()),
                                  );
                                }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
      builder: EasyLoading.init(),
    );
  }

  bool SignInValidation() {
    try {
      if (UsernameController.text.isEmpty) {
        EasyLoadingToastMessage(context, StrEnterEmailId);
        return false;
      }
      if (PasswordController.text.isEmpty) {
        EasyLoadingToastMessage(context, StrEnterPassword);
        return false;
      }
    } on Exception catch (e) {
      // TODO
      return false;
    }
    return true;
  }

  signIn(String email, String pass, BuildContext context) async {

    setState(() {
      // _isLoading = true;
      EasyLoading.show(status: 'Please Wait...');
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'restaurant_id':StrRestaruntId,'cust_email': email, 'cust_pswd': pass};
    var jsonResponse = null;
    var url = Uri.parse(LoginAPI);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        // setState(() {
        //   // _isLoading = false;
        EasyLoading.dismiss();
        // });
        if (jsonResponse['success'] == 1) {
          //var _userProfile = new List<UserProfile>();
          sharedPreferences.setString("message", LOGIN_COMPLETE);
          // sharedPreferences.setString(Auth_Token, _Auth_Token);
          EasyLoadingToastMessage(context, jsonResponse['message']);
          //List userdata = jsonResponse['userdata'];
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MainHomePage(0)),
          );
        //  EasyLoading.show(status: 'Please Wait...');
         // SetTokenAPI(_userProfile[0].residence_user_id,_Auth_Token,_userProfile[0].chng_pswd_rqst,context);
          // _userProfile = userdata
          //     .map((model) => UserProfile.fromJson(model))
          //     .toList();
        } else {
          EasyLoadingToastMessage(context, jsonResponse['message']);
        }
      }
    } else {
      setState(() {
        // _isLoading = false;
        EasyLoading.dismiss();
      });
      print(response.body);
    }
  }
}
