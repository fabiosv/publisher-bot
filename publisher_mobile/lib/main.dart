import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;

import './pages/splash_page.dart';
import './pages/login.dart';
import './pages/home.dart';
import './pages/create_post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/login': (BuildContext ctx) => Login(),
      '/home': (BuildContext ctx) => Home(),
      '/create_post': (BuildContext ctx) => CreatePost(),
    };

    if (Platform.isAndroid) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
        routes: routes,
      );
    } else {
      return CupertinoApp(
        title: 'My Pixels',
        routes: routes,
      );
    }
  }
}