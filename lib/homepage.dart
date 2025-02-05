import 'package:flutter/material.dart';
import 'community.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BaristaPro',
    theme: ThemeData(
      primaryColor: Color(0xFF6F3C1B),
      scaffoldBackgroundColor: Color.fromARGB(255, 241, 239, 237),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
        bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF5D4037)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF8B5E3B),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF3E2723),
        selectedItemColor: Color(0xFFD2A679),
        unselectedItemColor: Color(0xFF8B5E3B),
      ),
    ),
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomePage(),
      '/community': (context) => CommunityForumPage(),
       // Create ProfilePage if not yet defined
    },
  ));
}


class BaristaPro extends StatelessWidget {
  const BaristaPro({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BaristaPro',
      theme: ThemeData(
        primaryColor: Color(0xFF6F3C1B),
        scaffoldBackgroundColor: Color.fromARGB(255, 241, 239, 237),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF5D4037)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8B5E3B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF3E2723),
          selectedItemColor: Color(0xFFD2A679),
          unselectedItemColor: Color(0xFF8B5E3B),
        ),
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});


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
                    Icon(Icons.notifications, size: 28, color: Color(0xFF3E2723)),
                    Icon(Icons.settings, size: 28, color: Color(0xFF3E2723)),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            Text("Enhance your coffee skills and business."),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Search for coffee recipes, tools...",
                prefixIcon: Icon(Icons.search, color: Color(0xFF5D4037)),
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
                _featureButton(Icons.work, "Freelance Opportunities"),
                _featureButton(Icons.calendar_today, "Booking & Training"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _featureButton(Icons.store, "Marketplace"),
                _featureButton(Icons.restaurant_menu, "Recipes"),
              ],
            ),
            SizedBox(height: 20),
            Card(
              color: Color(0xFFF5E1C0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset('assets/coffeeShop.jpg', height: 120),
                    SizedBox(height: 10),
                    Text("Your Coffee, Your Way", style: Theme.of(context).textTheme.titleLarge),
                    Text("Shop coffee products, tools, and accessories."),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Get Started"),
                    ),
                  ],
                ),
              ),
            ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
  
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityForumPage()));
        break;
    }
  }


  Widget _featureButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFF8B5E3B),
          radius: 30,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF3E2723))),
      ],
    );
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
