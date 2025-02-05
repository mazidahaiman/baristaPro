import 'package:flutter/material.dart';
import 'homepage.dart';
import 'community.dart';
import 'profile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    HomePage(),
    CommunityForumPage(),
    ProfilePage(),
  ];

  void onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F4E37), // Change the color code here
      
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTapItem: onTapItem,
        // Change the color code here
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTapItem;

  CustomBottomNavBar({required this.selectedIndex, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      currentIndex: selectedIndex,
      onTap: onTapItem,
    );
  }
}