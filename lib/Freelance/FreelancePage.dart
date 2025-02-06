import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'FreelanceApply.dart';
import 'package:baristapros/components/Freelance/FreelanceJobCard.dart';
import 'package:baristapros/components/Freelance/JobSearchDelegate.dart';
import 'package:baristapros/components/Freelance/FilterSheet.dart';
import 'AddJobForm.dart';

class FreelancePage extends StatefulWidget {
  const FreelancePage({super.key});

  @override
  _FreelancePageState createState() => _FreelancePageState();
}

class _FreelancePageState extends State<FreelancePage> {
  String searchQuery = '';
  String selectedArea = 'All';
  double selectedRange = 50.0;

  Stream<QuerySnapshot> _jobsStream = FirebaseFirestore.instance.collection('jobs').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freelance Jobs'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: JobSearchDelegate([]), // Pass an empty list for now
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FilterSheet(
                    selectedArea: selectedArea,
                    selectedRange: selectedRange,
                    onApply: (area, range) {
                      setState(() {
                        selectedArea = area;
                        selectedRange = range;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _jobsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<Map<String, dynamic>> jobs = snapshot.data!.docs.map((doc) {
            return doc.data() as Map<String, dynamic>;
          }).toList();

          List<Map<String, dynamic>> filteredJobs = jobs.where((job) {
            bool matchesSearchQuery = job['jobTitle']
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
            bool matchesArea = selectedArea == 'All' ||
                job['location'].toLowerCase().contains(selectedArea.toLowerCase());
            // Add more filtering logic based on km range if needed
            return matchesSearchQuery && matchesArea;
          }).toList();

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: filteredJobs.length,
            itemBuilder: (context, index) {
              var job = filteredJobs[index];
              return FreelanceJobCard(
                jobTitle: job['jobTitle'],
                date: job['date'],
                location: job['location'] ?? 'N/A', // Default value if location is not provided
                startTime: job['startTime'] ?? 'N/A', // Default value if startTime is not provided
                endTime: job['endTime'] ?? 'N/A', // Default value if endTime is not provided
                jobScope: job['jobScope'] ?? 'N/A', // Default value if jobScope is not provided
                locationUrl: job['locationUrl'] ?? 'N/A', // Default value if locationUrl is not provided
                latitude: job['latitude'] ?? 0.0, // Default value if latitude is not provided
                longitude: job['longitude'] ?? 0.0, // Default value if longitude is not provided
                recruiterImage: job['recruiterImage'] ?? 'assets/default.png', // Default value if recruiterImage is not provided
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FreelanceApplyPage(
                        jobTitle: job['jobTitle'],
                        date: job['date'],
                        startTime: job['startTime'] ?? 'N/A',
                        endTime: job['endTime'] ?? 'N/A',
                        location: job['location'] ?? 'N/A',
                        jobScope: job['jobScope'] ?? 'N/A',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddJobForm(onAddJob: (newJob) {}),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}