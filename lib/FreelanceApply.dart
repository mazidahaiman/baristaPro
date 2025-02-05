import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FreelanceApplyPage extends StatelessWidget {
  final String jobTitle;
  final String date;
  final String startTime;
  final String endTime;
  final String location;
  final String jobScope;
  final String locationUrl;
  final double latitude;
  final double longitude;

  const FreelanceApplyPage({
    super.key,
    required this.jobTitle,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.jobScope,
    required this.locationUrl,
    required this.latitude,
    required this.longitude,
  });

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              'Shift: $startTime - $endTime',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launchURL(locationUrl),
              child: Text(
                'Location: $location',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(latitude, longitude),
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('jobLocation'),
                    position: LatLng(latitude, longitude),
                  ),
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Job Scope:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              jobScope,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle application submission
                },
                child: Text('Apply for Job'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}