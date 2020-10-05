import 'package:flutter/material.dart'; 
import 'package:attendance/screens/screens.dart'; 
class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  final List _screens = [
    AllClass(),
    AddUserClass("Class"),
    Scaffold(),
    Scaffold(),
  ];
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.add_rounded, Icons.account_circle,]
        .asMap()
        .map(
          (key, value) => MapEntry(key, BottomNavigationBarItem(
            title: Text(''),
            icon: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(color: _currentIndex == key ? Color(0xFF11249F).withOpacity(.85) : Colors.transparent, 
            borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(value),
            ),
            ),)
          ).values.toList(),
      ),
    );
  }
}