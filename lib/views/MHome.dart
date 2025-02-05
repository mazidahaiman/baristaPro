import 'package:flutter/material.dart';
import 'package:baristapros/views/MainPage.dart';

class MarketHome extends StatefulWidget {
  MarketHome({Key? key}) : super(key: key);
  @override
  _MarketHomeState createState() => _MarketHomeState();
}

class _MarketHomeState extends State<MarketHome> {
  int selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    MainPage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Home'),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

