import 'package:fixit/pages/LoginOrRegisterPage.dart';
import 'package:fixit/pages/LoginPage.dart';
import 'package:fixit/pages/MainPage.dart';
import 'package:fixit/pages/Register.dart';
import 'package:fixit/pages/SignIn.dart';
import 'package:fixit/pages/SplashScreen.dart';
import 'package:fixit/pages/WalkThrough.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreenPage());
      case '/RegisterPage':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/MainPage':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/LoginOrRegisterPage':
        return MaterialPageRoute(builder: (_) => LoginOrRegisterPage());
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/WalkThrough':
        return MaterialPageRoute(builder: (_) => WalkThrough());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
