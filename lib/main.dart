import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'marketplace.dart';
import 'booking.dart';

void main() {
  Stripe.publishableKey = "pk_test_51Qo6b6BLKlPtHpESHgtzUfMcRWWh66v2bRouNmmwqqG0SzrxYFkWJID0mpgfouSQFx1Xe8b0V7BQokYAyKUlIN6I00XGot2cZN";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BaristaPro App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarketplaceScreen()),
                );
              },
              child: Text('Go to Marketplace'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingScreen()),
                );
              },
              child: Text('Go to Booking'),
            ),
          ],
        ),
      ),
    );
  }
}