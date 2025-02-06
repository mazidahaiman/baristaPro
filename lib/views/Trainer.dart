import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:baristapros/views/Summary.dart';
=======
import 'package:trytest/views/Summary.dart';
>>>>>>> community-forum

class TrainerPage extends StatelessWidget {
  final List<Map<String, dynamic>> trainers = [
    {'name': 'John Doe', 'experience': '5 years'},
    {'name': 'Jane Smith', 'experience': '3 years'},
    {'name': 'Mike Johnson', 'experience': '7 years'},
  ];

  final Map<String, dynamic> selectedTraining;

  TrainerPage({required this.selectedTraining});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Trainer'),
      ),
      body: ListView.builder(
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          final trainer = trainers[index];
          return Card(
            child: ListTile(
              title: Text(trainer['name']),
              subtitle: Text('Experience: ${trainer['experience']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryPage(
                      selectedTraining: selectedTraining,
                      selectedTrainer: trainer,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}