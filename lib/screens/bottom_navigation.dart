import 'package:flutter/material.dart';
import 'package:tmdb/screens/favorites.dart';
import 'package:tmdb/screens/home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currIndex = 0;
  List screens = [Home(), Favorites()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
        currentIndex: currIndex,
        selectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            currIndex = value;
          });
        },
      ),
    );
  }
}
