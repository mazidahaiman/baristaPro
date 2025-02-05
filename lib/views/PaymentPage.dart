import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      // Create a payment method
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );
      // Use the paymentMethod variable
      print('Payment method created: $paymentMethod');
    } catch (e) {
      print('Error creating payment method: $e');
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