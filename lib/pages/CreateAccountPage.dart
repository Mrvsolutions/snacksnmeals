import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:snacksnmeals/Comman/Util.dart';
import 'package:snacksnmeals/Comman/string.dart';

import 'LoginPage.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String name = "", email = "", password = "";
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp regepassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  TextEditingController _aptNoController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _contactController = new TextEditingController();
  TextEditingController _applicationCodeController =
      new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _cnfPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange, accentColor: Colors.orange),
      home: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading:
        // ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 25.0, 5.0, 20.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                          child: Text(
                            "Welcome to \nGood Meals",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 0),
                          child: Text(
                            "Create your account.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              cursorColor: Colors.orange,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return StrEnterName;
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.orange,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange),
                                  ),
                                  hintText: "Enter Name",
                                  labelText: "Name",),
                              controller: _nameController,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              cursorColor: Colors.orange,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                                  hintText: "Enter Email-Id",
                                  labelText: "Email-Id"),
                              controller: _emailController,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              cursorColor: Colors.orange,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return StrEnterPassword;
                                  } else if (!regepassword.hasMatch(value)) {
                                    return StrValidPass;
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  focusColor: Colors.orange,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange),
                                  ),
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  errorMaxLines: 2),
                              controller: _passwordController,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              cursorColor: Colors.orange,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return StrEnterConfmpass;
                                  } else if (value.length < 6) {
                                    return StrValidPass;
                                  } else if (_passwordController.text !=
                                      _cnfPassController.text) {
                                    return StrnotmatchPassword;
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.orange,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                hintText: "Enter Confirm Password",
                                labelText: "Confirm Password",
                              ),
                              controller: _cnfPassController,
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                                // FocusScopeNode currentFocus =
                                // FocusScope.of(context);
                                // if (!currentFocus.hasPrimaryFocus &&
                                //     currentFocus.focusedChild != null) {
                                //   currentFocus.focusedChild.unfocus();
                                // }
                                // if (SignupValidation()) {
                                //   // Signup(
                                //   //     _aptNoController.text,
                                //   //     _nameController.text,
                                //   //     _contactController.text,
                                //   //     _applicationCodeController.text,
                                //   //     _emailController.text,
                                //   //     _passwordController.text);
                                // }
                              },
                              child: Text("SIGN UP"),
                              color: Colors.orange,
                              textColor: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'Already have an account?',
                            style: new TextStyle(fontSize: 16)),
                        new TextSpan(
                            text: ' Sign in',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Single tapped.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage()),
                                );
                              }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      builder: EasyLoading.init(),
    );
  }

  bool SignupValidation() {
    try {
      if (_nameController.text.isEmpty) {
        EasyLoadingToastMessage(context, StrEnterName);
        return false;
      }
      if (_emailController.text.isEmpty) {
        EasyLoadingToastMessage(context, StrEnterEmailId);
        return false;
      }
      if (!reg.hasMatch(_emailController.text)) {
        EasyLoadingToastMessage(context, StrEnterValidEmailId);
        return false;
      }
      if (_passwordController.text.isEmpty) {
        EasyLoadingToastMessage(context, StrEnterPassword);
        return false;
      }
      if (_passwordController.text.length < 6) {
        EasyLoadingToastMessage(context, StrValidPass);
        return false;
      }
      if (_cnfPassController.text.isEmpty) {
        EasyLoadingToastMessage(context, StrEnterConfmpass);
        return false;
      }
      if (_cnfPassController.text.length < 6) {
        EasyLoadingToastMessage(context, StrValidPass);
        return false;
      }
      if (_passwordController.text != _cnfPassController.text) {
        EasyLoadingToastMessage(context, StrnotmatchPassword);
      }
    } on Exception catch (e) {
      // TODO
      return false;
    }
    return true;
  }
}
