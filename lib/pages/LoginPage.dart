import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController passwordController = TextEditingController();
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
        key: globalKey,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[],
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
