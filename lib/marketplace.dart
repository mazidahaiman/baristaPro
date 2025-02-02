import 'package:flutter/material.dart';
import 'package:baristapros/contants.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class MarketplaceScreen extends StatelessWidget {
  final List<CoffeeItem> coffeeItems = [
    CoffeeItem(name: 'Espresso', price: 3.0),
    CoffeeItem(name: 'Latte', price: 4.0),
    CoffeeItem(name: 'Cappuccino', price: 4.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Marketplace'),
      ),
      body: ListView.builder(
        itemCount: coffeeItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(coffeeItems[index].name),
            subtitle: Text('\$${coffeeItems[index].price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () => _initiatePayment(context, coffeeItems[index]),
              child: Text('Buy'),
            ),
          );
        },
      ),
    );
  }

  void _initiatePayment(BuildContext context, CoffeeItem item) async {
    // Initialize Stripe
    Stripe.publishableKey = 'your-publishable-key';

    // Create a payment intent on your server and retrieve the client secret
    final clientSecret = await _createPaymentIntent(item.price);

    // Confirm the payment with the client secret
    await Stripe.instance.confirmPayment(
      PaymentIntent(
        clientSecret: clientSecret,
        paymentMethodId: 'your-payment-method-id',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment for ${item.name} successful!')),
    );
  }

  Future<String> _createPaymentIntent(double amount) async {
    // Call your backend to create a payment intent and return the client secret
    // This is a placeholder implementation
    return 'your-client-secret';
  }
}

class CoffeeItem {
  final String name;
  final double price;

  CoffeeItem({required this.name, required this.price});
}