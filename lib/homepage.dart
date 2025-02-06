import 'package:baristapros/views/BookingPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:baristapros/booking.dart';
import 'package:baristapros/views/MainPage.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, Barista!", style: Theme.of(context).textTheme.titleLarge),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications, size: 28, color: Color(0xFF3E2723)),
                      onPressed: () {},
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.settings, size: 28, color: Color(0xFF3E2723)),
                      onSelected: (String value) {
                        if (value == 'terms') {
                          // Navigate to terms and policies page (Implement later)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Terms & Policies Clicked")),
                          );
                        } else if (value == 'logout') {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacementNamed('/');
                        }
                      },
                      
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'terms',
                          child: Text('Terms & Policies'),
                        ),
                        PopupMenuItem<String>(
                          value: 'logout',
                          child: Text('Log Out'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text("Enhance your coffee skills and business."),
            SizedBox(height: 20),
            TextField(
              //controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for coffee recipes, tools...",
                prefixIcon: IconButton(
                  icon: Icon(Icons.search, color: Color(0xFF5D4037)),
                  onPressed: () {
                    print("Searching: \${_searchController.text}");
                    // Implement search functionality here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Color(0xFFF5E1C0),
              ),
            ),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _featureButtonWithNavigation(context, Icons.store, "Marketplace", MainPage()),
                  _featureButtonWithNavigation(context, Icons.work, "Freelance Opportunities", MainPage()), //updated
                  _featureButtonWithNavigation(context, Icons.calendar_today, "Booking & Training", BookingPage()),
                ],
              ),
            SizedBox(height: 20),
            
            SizedBox(height: 20),
            Text("Top Baristas", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _baristaProfile("assets/barista1.jpg", "Alex"),
                ElevatedButton(
                      onPressed: () {},
                      child: Text("Follow"),
                    ),
                _baristaProfile("assets/barista2.jpg", "Samantha"),
                ElevatedButton(
                      onPressed: () {},
                      child: Text("Follow"),
                    ),
              ],
            ),
          ],
        ),
        ),
    );
  }
  


Widget _featureButtonWithNavigation(BuildContext context, IconData icon, String label, Widget page) {
  return Column(
    children: [
      MouseRegion(
        cursor: SystemMouseCursors.click, // Change cursor on hover
        onEnter: (_) {
          // Increase size on hover
          _changeSize(context, 33);
        },
        onExit: (_) {
          // Revert size after hover
          _changeSize(context, 30);
        },
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF8B5E3B),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              child: Icon(icon, color: Colors.white, size: 30),
            ),
          ),
        ),
            ),
            SizedBox(height: 5),
            Text(label, textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF3E2723))),
          ],
        );
      }

      void _changeSize(BuildContext context, double size) {
        // Implement size change logic here
        // This function should trigger a rebuild with the new size
            }


  Widget _baristaProfile(String imagePath, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF3E2723))),
      ],
    );
  }
}