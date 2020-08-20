import 'package:fixit/models/user.dart';
import 'package:fixit/pages/LoginPage.dart';
import 'package:fixit/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

import '../Preferences.dart';

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  User user = new User();
  bool walk;
  bool afterwalk;
  final pages = [
    SkOnboardingModel(
        title: 'First Page\nWalk',
        titleColor: Colors.red,
        description: 'Created by irshad',
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/splash.jpg'),
    SkOnboardingModel(
        title: 'Second page',
        titleColor: Colors.red,
        description: 'Created by irshad',
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/splash.jpg'),
    SkOnboardingModel(
        title: 'Third Page',
        description: 'Created by irshad',
        titleColor: Colors.red,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/splash.jpg'),
    SkOnboardingModel(
        title: 'Fourth Page',
        description: 'Created y irshad',
        titleColor: Colors.red,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/splash.jpg'),
  ];

  @override
  initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    await Preferences.getUser().then((value) {
      setState(() {
        user = value;
      });
    });
    await Preferences.getWalkThrough().then((value) {
      walk = value;
    });
    if (this.user.name == '--') {
      afterwalk = false;
    } else {
      afterwalk = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (walk == false) {
      return Scaffold(
        body: SKOnboardingScreen(
          bgColor: Colors.white,
          themeColor: const Color(0xFFf74269),
          pages: pages,
          skipClicked: (value) {
            Preferences.setUser(
              "--",
              "--",
              "--",
            );
            Preferences.setWalkThrough().then((value) {});
            Navigator.of(context).pushReplacementNamed('/LoginPage');
          },
          getStartedClicked: (value) {
            Preferences.setUser(
              "--",
              "--",
              "--",
            );
            Preferences.setWalkThrough().then((value) {});
            Navigator.of(context).pushReplacementNamed('/LoginPage');
          },
        ),
      );
    } else if (afterwalk == false) {
      return new LoginPage();
    } else {
      return new MainPage();
    }
  }
}
