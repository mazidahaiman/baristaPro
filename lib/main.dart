import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(BaristaPro());
}

class BaristaPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F4E37),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/coffeeShop.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(flex: 3, child: Container()),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3E2723)),
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF5D4037)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F4E37),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFF5E0C3))),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: "Email", filled: true, fillColor: Color(0xFFF5E0C3), border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextField(obscureText: true, decoration: InputDecoration(labelText: "Password", filled: true, fillColor: Color(0xFFF5E0C3), border: OutlineInputBorder())),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3E2723)),
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F4E37),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFF5E0C3))),
              TextField(decoration: InputDecoration(labelText: "Email", filled: true, fillColor: Color(0xFFF5E0C3), border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: "Password", filled: true, fillColor: Color(0xFFF5E0C3), border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: "Confirm Password", filled: true, fillColor: Color(0xFFF5E0C3), border: OutlineInputBorder())),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
