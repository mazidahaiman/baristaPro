import 'package:flutter/material.dart';
import 'FreelanceApply.dart'; // Add this import statement

class FreelancePage extends StatelessWidget {
  const FreelancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freelance Jobs'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          FreelanceJobCard(
            jobTitle: 'Flutter Developer',
            date: '2023-10-01',
            location: 'Remote',
            startTime: '09:00 AM',
            endTime: '05:00 PM',
            jobScope: 'Develop and maintain Flutter applications.',
            locationUrl: 'https://www.google.com/maps/search/?api=1&query=Remote',
            latitude: 37.7749, // Example latitude
            longitude: -122.4194, // Example longitude
            recruiterImage: 'assets/recruiter1.png', // Replace with your image asset
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FreelanceApplyPage(
                    jobTitle: 'Flutter Developer',
                    date: '2023-10-01',
                    startTime: '09:00 AM',
                    endTime: '05:00 PM',
                    location: 'Remote',
                    jobScope: 'Develop and maintain Flutter applications.',
                    locationUrl: 'https://www.google.com/maps/search/?api=1&query=Remote',
                    latitude: 37.7749, // Example latitude
                    longitude: -122.4194, // Example longitude
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          FreelanceJobCard(
            jobTitle: 'Backend Developer',
            date: '2023-10-05',
            location: 'New York, NY',
            startTime: '10:00 AM',
            endTime: '06:00 PM',
            jobScope: 'Develop and maintain backend services.',
            locationUrl: 'https://www.google.com/maps/search/?api=1&query=New+York+NY',
            latitude: 40.7128, // Example latitude
            longitude: -74.0060, // Example longitude
            recruiterImage: 'assets/recruiter2.png', // Replace with your image asset
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FreelanceApplyPage(
                    jobTitle: 'Backend Developer',
                    date: '2023-10-05',
                    startTime: '10:00 AM',
                    endTime: '06:00 PM',
                    location: 'New York, NY',
                    jobScope: 'Develop and maintain backend services.',
                    locationUrl: 'https://www.google.com/maps/search/?api=1&query=New+York+NY',
                    latitude: 40.7128, // Example latitude
                    longitude: -74.0060, // Example longitude
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          FreelanceJobCard(
            jobTitle: 'UI/UX Designer',
            date: '2023-10-10',
            location: 'San Francisco, CA',
            startTime: '08:00 AM',
            endTime: '04:00 PM',
            jobScope: 'Design user interfaces and user experiences.',
            locationUrl: 'https://www.google.com/maps/search/?api=1&query=San+Francisco+CA',
            latitude: 37.7749, // Example latitude
            longitude: -122.4194, // Example longitude
            recruiterImage: 'assets/recruiter3.png', // Replace with your image asset
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FreelanceApplyPage(
                    jobTitle: 'UI/UX Designer',
                    date: '2023-10-10',
                    startTime: '08:00 AM',
                    endTime: '04:00 PM',
                    location: 'San Francisco, CA',
                    jobScope: 'Design user interfaces and user experiences.',
                    locationUrl: 'https://www.google.com/maps/search/?api=1&query=San+Francisco+CA',
                    latitude: 37.7749, // Example latitude
                    longitude: -122.4194, // Example longitude
                  ),
                ),
              );
            },
          ),
          // Add more FreelanceJobCard widgets as needed
        ],
      ),
    );
  }
}

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