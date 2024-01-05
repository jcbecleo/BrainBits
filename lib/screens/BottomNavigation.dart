import 'package:flutter/material.dart';
import 'package:trivia_app/screens/Dashboard.dart';
import 'package:trivia_app/screens/Movies.dart';
import 'package:trivia_app/screens/Sports.dart';

class BottomNavigator extends StatefulWidget {
  static const String routeName = "homepage";
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigator> {
  int pageIndex = 0;
  final List<Widget> _pages = [Dashboard(), Sports(), Movies()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset), label: "Video Games"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball), label: "Sports"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
        ],
        currentIndex: pageIndex,
        onTap: (index) {
          if (index != pageIndex) {
            setState(() {
              pageIndex = index;
            });
          }
        },
      ),
    );
  }
}
