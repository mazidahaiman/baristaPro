import 'package:flutter/material.dart';
import 'package:baristapros/views/PaymentPage.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, dynamic> selectedTraining;
  final Map<String, dynamic> selectedTrainer;

  SummaryPage({required this.selectedTraining, required this.selectedTrainer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
        backgroundColor: Colors.brown[800],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/coffee_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Training: ${selectedTraining['title']}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${selectedTraining['description']}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${selectedTraining['price']}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[700],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Trainer: ${selectedTrainer['name']}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Experience: ${selectedTrainer['experience']}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[700],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle proceed to payment
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[800],
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Proceed to Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}