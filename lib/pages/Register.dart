import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final globalKey = GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  bool _hidepassword = true;

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: globalKey,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[],
      ),
    );
  }
}
