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
    final response = await http.post(
      Uri.parse("https://api.stripe.com/v1/payment_intents"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"amount": amount, "currency": currency}),
    );

    final responseData = jsonDecode(response.body);
    return responseData["clientSecret"];
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
            subtitle: Text('\$${item.price}'),
            trailing: ElevatedButton(
              onPressed: () => _initiatePayment(context, item.price),
              child: Text('Buy'),
            ),
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