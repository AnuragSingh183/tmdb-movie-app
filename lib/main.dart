import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tmdb/providers.dart';
import 'package:tmdb/screens/authscreen.dart';
import 'package:tmdb/screens/bottom_navigation.dart';
import 'package:tmdb/screens/description.dart';
import 'package:tmdb/screens/home.dart';
import './screens/authscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Auth())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
        home: //BottomNavigation(),
            AuthScreen(), //Login(),
        routes: {
          "/description": (_) => Description("name", "description", "posterurl",
              "rating", "release", "bannerurl"),
        },
      ),
    );
  }
}
