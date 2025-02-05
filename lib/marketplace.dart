import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class MarketplaceScreen extends StatelessWidget {
  final List<CoffeeItem> coffeeItems = [
    CoffeeItem(name: 'Espresso', price: 3.0),
    CoffeeItem(name: 'Latte', price: 4.0),
    CoffeeItem(name: 'Cappuccino', price: 4.5),
  ];

  Future<void> _initiatePayment(BuildContext context, double amount) async {
    try {
      final clientSecret = await _createPaymentIntent(amount, 'usd');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "BaristaPro",
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed: $error")));
    }
  }

  Future<String> _createPaymentIntent(double amount, String currency) async {
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
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['client_secret'];
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
        title: Text('Marketplace'),
      ),
      body: ListView.builder(
        itemCount: coffeeItems.length,
        itemBuilder: (context, index) {
          final item = coffeeItems[index];
          return ListTile(
            title: Text(item.name),
            trailing: Text('\$${item.price.toStringAsFixed(2)}'),
            onTap: () => _initiatePayment(context, item.price),
          );
        },
      ),
    );
  }
}

class CoffeeItem {
  final String name;
  final double price;

  CoffeeItem({required this.name, required this.price});
}