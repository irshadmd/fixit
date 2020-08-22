import 'package:fixit/appconfig/app_config.dart' as config;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ProgressDialog pr;
  bool _hidepassword = true;

  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;
  });

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
        resizeToAvoidBottomInset: true,
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
            "Sign In",
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
              bottom: 100,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(40.5),
//                color: Colors.red,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue[300], shape: BoxShape.circle),
                        child: Icon(
                          Icons.person,
                          color: Colors.blue[900],
                          size: 70,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                            prefixIcon:
                                Icon(Icons.lock_outline, color: Colors.blue[900]),
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
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Colors.blue[900],
                                    value: rememberMe,
                                    onChanged: _onRememberMeChanged,
                                ),
                                Text("Remember me",style: TextStyle(color: Colors.black),)
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/ForgetPassword');
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(color: Colors.black),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                side: BorderSide(color: Colors.white)),
                          ),
                        ],
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
                        "Sign In",
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
