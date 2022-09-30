// screens/screen_index.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:njapp/tabs/tab_home.dart';
import 'package:njapp/tabs/tab_profile.dart';
import 'package:njapp/tabs/tab_setting.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() {
    return _IndexScreenState();
  }
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    TabHome(),
    TabSetting(),
    TapProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('NJ Test'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 44,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
      body: tabs[_currentIndex],
    );
  }
}
