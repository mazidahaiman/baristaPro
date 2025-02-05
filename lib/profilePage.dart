import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2, // 30% of the screen height
                child: Container(
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 8, // 70% of the screen height
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    SizedBox(height: 20), // Add some space between the title and the card
                    ProfileCard(),
                    SizedBox(height: 20), // Add some space between the card and the text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Profile Settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Add some space between the text and the content card
                    ContentCard(
                      items: [
                        _buildContentItem(Icons.school, "My Certificate", () {
                          // Handle My Certificate press
                        }),
                        Divider(),
                        _buildContentItem(Icons.work, "Freelance Jobs", () {
                          // Handle Freelance Jobs press
                        }),
                        Divider(),
                        _buildContentItem(Icons.shopping_cart, "My Order", () {
                          // Handle My Order press
                        }),
                      ],
                    ),
                    SizedBox(height: 20), // Add some space between the content cards
                    ContentCard(
                      items: [
                        _buildContentItem(Icons.settings, "Settings", () {
                          // Handle Settings press
                        }),
                        Divider(),
                        _buildContentItem(Icons.logout, "Log Out", () {
                          _showLogoutDialog(context);
                        }, color: Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentItem(IconData icon, String title, VoidCallback onPressed, {Color color = Colors.black}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Icon(icon, color: color), // Change icon color to the specified color
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: color), // Change text color to the specified color
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Log Out"),
          content: Text("Are you sure?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // Red background
                foregroundColor: Colors.white, // White text
              ),
              onPressed: () {
                // Handle log out action
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/avatar.png"), // Replace with a network image if needed
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ayodele Motunrayo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.brown[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Coffee Expert",
                  style: TextStyle(fontSize: 14, color: Colors.brown[800]),
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black54),
            onPressed: () {
              // Handle edit profile action
            },
          ),
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final List<Widget> items;

  const ContentCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: items,
      ),
    );
  }
}