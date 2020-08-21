import 'package:fixit/models/user.dart';
import 'package:fixit/pages/WalkThrough.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  User user = new User();

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      photoSize: 150,
      image: Image.asset('assets/splash.jpg'),
      navigateAfterSeconds: new WalkThrough(),
    );
  }
}
