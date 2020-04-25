import 'package:flutter/material.dart';

import './my_posts.dart';
import './groups.dart';

class Home extends StatefulWidget {
  Home();
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  static int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  final List<Widget> _pages = [
    MyPosts(),
    Groups(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Posts')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Grupos')
          )
        ]
      ),
    );
  }
}
