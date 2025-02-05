import 'package:flutter/material.dart';

class CommunityForumPage extends StatefulWidget {
  const CommunityForumPage({super.key});

  @override
  _CommunityForumPageState createState() => _CommunityForumPageState();
}

class _CommunityForumPageState extends State<CommunityForumPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/community');
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community Forum"),
        backgroundColor: Color(0xFF6F3C1B),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search posts...",
                prefixIcon: Icon(Icons.search, color: Color(0xFF5D4037)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Color(0xFFF5E1C0),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _forumPost("Alex", "What’s the best espresso machine for a beginner?"),
                  _forumPost("Samantha", "Any tips for latte art?"),
                  _forumPost("Jordan", "How do you price your coffee as a freelancer?"),
                  _forumPost("Taylor", "Favorite coffee beans this season?"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF8B5E3B),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFD2A679),
        unselectedItemColor: Color(0xFF8B5E3B),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _forumPost(String author, String content) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Color(0xFFF5E1C0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF8B5E3B),
          child: Text(author[0], style: TextStyle(color: Colors.white)),
        ),
        title: Text(author, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3E2723))),
        subtitle: Text(content, style: TextStyle(color: Color(0xFF5D4037))),
        trailing: Icon(Icons.comment, color: Color(0xFF3E2723)),
      ),
    );
  }
}
