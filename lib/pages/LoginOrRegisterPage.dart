import 'package:fixit/appconfig/app_config.dart' as config;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  @override
  _LoginOrRegisterPageState createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mobileController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
            "Login/Register",
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
                    image: AssetImage("assets/orangeback.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(35.5),
//                color: Colors.red,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.orange[200], shape: BoxShape.circle),
                        child: Icon(
                          Icons.person,
                          color: Colors.orangeAccent,
                          size: 70,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                        decoration: BoxDecoration(
                            color: Colors.orange[200],
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: TextField(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          maxLength: 10,
                          decoration: InputDecoration(
                            labelText: "Mobile Number",
                            labelStyle: TextStyle(color: Colors.white),
                            contentPadding: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            hintText: 'Enter Mobile Number',
                            prefixIcon:
                            Icon(Icons.phone, color: Colors.white),
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
                        "PROCEED",
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
