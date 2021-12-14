import "package:flutter/material.dart";
import 'package:tmdb/screens/bottom_navigation.dart';
import 'package:tmdb/screens/description.dart';
import 'package:tmdb/screens/home.dart';
import 'package:tmdb/screens/login.dart';
import './screens/trending.dart';
import './screens/top_rated.dart';
import 'package:tmdb_api/tmdb_api.dart';
import './screens/tv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
      home: BottomNavigation(),//Login(),
      routes: {
        "/description": (_) => Description("name", "description", "posterurl",
            "rating", "release", "bannerurl"),
        
      },
    );
  }
}

