import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snacksnmeals/BgImage.dart';
import 'package:snacksnmeals/pages/CreateAccountPage.dart';

class SignupMainPage extends StatefulWidget {
  _SignupMainPageState createState() => _SignupMainPageState();
}

class _SignupMainPageState extends State<SignupMainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            BgImage(),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Card(
                  margin: const EdgeInsets.all(30),
                  elevation: 2,
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15), bottom: Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 60.0,
                        width: 60.0,
                        child: Image.asset(
                          "assets/ic_chef.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "GOOD MEALS",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 28,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50 , 20, 50, 20),
                            child: Container(
                              child: Text(
                                "It is a long established fact that a reader will be distracted bty the readable content of the page when looking at its layout.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w300,
                                    height: 1.4,
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
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
                                      builder: (context) =>
                                          CreateAccountPage()),
                                );
                              },
                              child: Text("Create Account"),
                              color: Colors.orange,
                              textColor: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RichText(
                            text: TextSpan(
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                new TextSpan(
                                    text: ' Sign in',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
