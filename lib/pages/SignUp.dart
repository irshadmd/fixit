import 'package:fixit/appconfig/app_config.dart' as config;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();
  ProgressDialog pr;
  bool _hidepassword = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context,
        isDismissible: false,
        customBody: Container(
            color: Colors.transparent,
            child: SpinKitCubeGrid(
              color: Theme.of(context).accentColor,
            )));
    pr.style(
      backgroundColor: Colors.transparent,
    );

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: globalKey,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/LoginPage');
              },
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              )),
          actions: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            )
          ],
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(45.5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/blueback.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(80.5),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue[300].withOpacity(0.8), shape: BoxShape.circle),
                        child: Icon(
                          Icons.person_add,
                          color: Colors.blue[900],
                          size: 70,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: config.App(context).appWidth(45),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.blue[300].withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: TextField(
                              controller: fNameController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "First Name",
                                labelStyle: TextStyle(color: Colors.white),
                                contentPadding: new EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                hintText: 'Enter First Name',
                                prefixIcon: Icon(Icons.perm_identity,
                                    color: Colors.blue[900]),
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: config.App(context).appWidth(45),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.blue[300].withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: TextField(
                              controller: lNameController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Last Name",
                                labelStyle: TextStyle(color: Colors.white),
                                contentPadding: new EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                hintText: 'Enter Last Name',
                                prefixIcon: Icon(Icons.perm_identity,
                                    color: Colors.blue[900]),
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 22.0, right: 22.0),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.blue[300].withOpacity(0.8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            labelStyle: TextStyle(color: Colors.white),
                            contentPadding: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            hintText: 'Enter Email Address',
                            prefixIcon:
                                Icon(Icons.email, color: Colors.blue[900]),
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 22.0, right: 22.0),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.blue[300].withOpacity(0.8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: TextStyle(color: Colors.black),
                          obscureText: this._hidepassword ? true : false,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            contentPadding: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            hintText: '••••••••••••',
                            prefixIcon: Icon(Icons.lock_outline,
                                color: Colors.blue[900]),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  this._hidepassword = !this._hidepassword;
                                });
                              },
                              child: Icon(Icons.remove_red_eye,
                                  color: this._hidepassword
                                      ? Colors.white30
                                      : Colors.white),
                            ),
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                color: Colors.red,
                width: config.App(context).appWidth(100),
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pushNamed('/LoginPage');
  }
}
