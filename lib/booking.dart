import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? paymentIntent;

  Future<void> _makePayment() async {
    try {
      // 1️⃣ Create Payment Intent
      paymentIntent = await _createPaymentIntent(20.0, 'usd');

      // 2️⃣ Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: "Your App",
        ),
      );

      // 3️⃣ Present Payment Sheet
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
      
      setState(() {
        paymentIntent = null;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed: $error")));
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(double amount, String currency) async {
    try {
      // ⚠️ Using Secret Key Directly (Not Recommended)
      const stripeSecretKey = "sk_test_51Qo6b6..."; // Your Secret Key

      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          "Authorization": "Bearer $stripeSecretKey",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "amount": (amount * 100).toString(), // Convert to cents
          "currency": currency,
          "payment_method_types[]": "card",
        },
      );

      return jsonDecode(response.body);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Add your form fields here
              ElevatedButton(
                onPressed: _makePayment,
                child: Text("Make Payment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}