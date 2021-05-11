import 'package:flutter/material.dart';
import 'package:study_buddy/pages/home/chat.dart';
import 'package:study_buddy/pages/home/profile.dart';
import 'package:study_buddy/pages/home/connect.dart';
import 'package:study_buddy/services/auth.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
  final List <Widget> screens = [
    Profile(),
    Connect(),
    Chat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan[700],
        unselectedItemColor: Colors.cyan[700],
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          print(currentIndex);
        }
      ),
    );
  }
}

