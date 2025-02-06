import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FreelanceApplyPage extends StatelessWidget {
  final String jobTitle;
  final String date;
  final String startTime;
  final String endTime;
  final String location;
  final String jobScope;

  const FreelanceApplyPage({
    super.key,
    required this.jobTitle,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.jobScope,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for $jobTitle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Start Time: $startTime',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'End Time: $endTime',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Location: $location',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Job Scope: $jobScope',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle apply job action
          },
          child: Text('Apply for Job'),
        ),
      ),
    );
  }
}