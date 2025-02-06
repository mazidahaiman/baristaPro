import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLIC_KEY']!;
  }

  Future<void> _handlePayment() async {
    try {
      final paymentIntentData = await _createPaymentIntent(100.0, 'usd');
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      final confirmPaymentIntent = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: paymentIntentData['client_secret'],
        data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      if (confirmPaymentIntent.status == PaymentIntentsStatus.Succeeded) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed!")));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed: $e")));
      }
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(double amount, String currency) async {
    try {
      final stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY']!;

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
        title: Text('Payment Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handlePayment,
          child: Text('Make Payment'),
        ),
      ),
    );
  }
}