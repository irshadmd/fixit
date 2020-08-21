import 'dart:io';

import 'package:fixit/appconfig/app_config.dart' as config;
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Positioned(
              top: 20,
              right: 15,
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(29.5) - 100,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(35.5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/splash.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(45.5),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Login or Register",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Divider(
                      height: 40.0,
                      thickness: 1.5,
                      indent: 50,
                      endIndent: 50,
                      color: Colors.black,
                    ),
                    Container(
                      color: Colors.black,
                      width: config.App(context).appWidth(100),
                      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/LoginOrRegisterPage');
                        },
                        child: Text(
                          "ENTER PHONE NUMBER",
                          style: TextStyle(color: Colors.yellowAccent),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.redAccent,
                      width: config.App(context).appWidth(100),
                      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/SignIn');
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(color: Colors.redAccent)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: config.App(context).appWidth(100),
                      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => {exit(0)},
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
