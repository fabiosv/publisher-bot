import 'package:flutter/material.dart';

import './my_posts.dart';
import './groups.dart';
import './history.dart';

import '../models/User.dart';

class Home extends StatefulWidget {
  final User user;

  Home({Key key, this.user });

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  User currentUser;
  static int _currentIndex;

  void updateModel(User newUser) {
    if (newUser != currentUser) {
      setState(() {
        currentUser = newUser;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    currentUser = widget.user;
  }

  final List<Widget> _pages = [
    MyPosts(),
    Groups(),
    History(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String uid = widget.user.uid;
    print('Home: $uid');
    return UserBinding(userModel: widget.user, child: Scaffold(
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Histórico')
          )
        ]
      ),
    ));
  }
}
