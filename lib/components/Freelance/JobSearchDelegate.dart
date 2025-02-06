import 'package:flutter/material.dart';
import '../../Freelance/FreelanceApply.dart';
import 'package:baristapros/components/Freelance/FreelanceJobCard.dart';

class JobSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> jobs;

  JobSearchDelegate(this.jobs);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> results = jobs.where((job) {
      return job['jobTitle'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var job = results[index];
        return FreelanceJobCard(
          jobTitle: job['jobTitle'],
          date: job['date'],
          location: job['location'],
          startTime: job['startTime'],
          endTime: job['endTime'],
          jobScope: job['jobScope'],
          locationUrl: job['locationUrl'],
          latitude: job['latitude'],
          longitude: job['longitude'],
          recruiterImage: job['recruiterImage'],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FreelanceApplyPage(
                  jobTitle: job['jobTitle'],
                  date: job['date'],
                  startTime: job['startTime'],
                  endTime: job['endTime'],
                  location: job['location'],
                  jobScope: job['jobScope'],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> suggestions = jobs.where((job) {
      return job['jobTitle'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        var job = suggestions[index];
        return ListTile(
          title: Text(job['jobTitle']),
          onTap: () {
            query = job['jobTitle'];
            showResults(context);
          },
        );
      },
    );
  }
}