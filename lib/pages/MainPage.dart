import 'dart:io';

import 'package:badges/badges.dart';
import 'package:fixit/Helper/nav_drawer.dart';
import 'package:fixit/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Home"),
        backgroundColor: Colors.redAccent),
    BottomNavigationBarItem(
        icon: Icon(Icons.shop),
        title: Text("Shop"),
        backgroundColor: Colors.redAccent),
  ];

  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  final tabs = [
    new HomePage(),
    Center(
      child: Text("SHOP"),
    ), //new Login()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          // backgroundColor: Colors.grey.withOpacity(0.8),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => {
              setState(() {
                _currentIndex = index;
              })
            },
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            items: items,
          ),
          drawer: DrawerWidget(),
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: <Widget>[
                Container(
                    width: 50, child: Image.asset("assets/freshodaily.png")),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).accentColor,
                        size: 15,
                      ),
                      Text(
                        "Chennai",
                        style: GoogleFonts.raleway(
                          color: Theme.of(context).accentColor,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/Cart');
                    },
                    child: Badge(
                      badgeColor: Colors.black87,
                      badgeContent: Text(
                        "$count",
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(Icons.shopping_cart, color: Colors.redAccent),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: tabs[_currentIndex]),
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
