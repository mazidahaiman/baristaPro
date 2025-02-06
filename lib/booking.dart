import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Map<String, dynamic>? paymentIntent;

  Future<void> _handlePayment() async {
    try {
      final paymentIntentData = await _createPaymentIntent(100.0, 'usd');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
      
      setState(() {
        paymentIntent = paymentIntentData;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed: $error")));
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(double amount, String currency) async {
    try {
      // ⚠️ Using Secret Key Directly (Not Recommended)
      const stripeSecretKey = "sk_test_51Qo6b6BLKlPtHpESBYTImTEbb2q3QjvtRy8CJaWbZxbVYEyaO5mJurVdXWKnQOEI9Eni59MmpJLkyCsSeMFSkBzb00zefazbN5"; // Your Secret Key

      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          "Authorization": "Bearer $stripeSecretKey",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          'amount': (amount * 100).toString(), // Stripe expects the amount in cents
          'currency': currency,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create payment intent');
      }
    } catch (error) {
      throw Exception('Error creating payment intent: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handlePayment,
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}