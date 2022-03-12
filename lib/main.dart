import "package:flutter/material.dart";
import 'package:tmdb/screens/authscreen.dart';
import 'package:tmdb/screens/bottom_navigation.dart';
import 'package:tmdb/screens/description.dart';
import './screens/authscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
      home: AuthScreen(), //Login(),
      routes: {
        "/description": (_) => Description("name", "description", "posterurl",
            "rating", "release", "bannerurl"),
      },
    );
  }
}
