import 'package:flutter/material.dart';

class FreelanceJobCard extends StatelessWidget {
  final String jobTitle;
  final String date;
  final String location;
  final String startTime;
  final String endTime;
  final String jobScope;
  final String locationUrl;
  final double latitude;
  final double longitude;
  final String recruiterImage;
  final VoidCallback onTap;

  const FreelanceJobCard({
    required this.jobTitle,
    required this.date,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.jobScope,
    required this.locationUrl,
    required this.latitude,
    required this.longitude,
    required this.recruiterImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(12.0), // Make the card smaller
          child: Row(
            children: [
              CircleAvatar(
                radius: 25, // Make the avatar smaller
                backgroundImage: AssetImage(recruiterImage), // Replace with your image asset
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitle,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Make the text smaller
                    ),
                    SizedBox(height: 5),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey, fontSize: 12), // Make the text smaller
                    ),
                    SizedBox(height: 5),
                    Text(
                      location,
                      style: TextStyle(color: Colors.grey, fontSize: 12), // Make the text smaller
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Shift: $startTime - $endTime',
                      style: TextStyle(color: Colors.grey, fontSize: 12), // Make the text smaller
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}