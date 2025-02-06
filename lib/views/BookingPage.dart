import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:baristapros/views/Trainer.dart';
=======
import 'package:trytest/views/Trainer.dart';
>>>>>>> community-forum

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final List<Map<String, dynamic>> _trainings = [
    {
      'title': 'Basic Coffee Brewing',
      'description': 'Learn the basics of coffee brewing.',
      'price': 50,
    },
    {
      'title': 'Advanced Espresso Techniques',
      'description': 'Master the art of espresso making.',
      'price': 100,
    },
    {
      'title': 'Latte Art Workshop',
      'description': 'Create beautiful latte art.',
      'price': 75,
    },
    {
      'title': 'Cold Brew Mastery',
      'description': 'Learn how to make the perfect cold brew.',
      'price': 60,
    },
    {
      'title': 'Coffee Cupping',
      'description': 'Taste and evaluate different coffee beans.',
      'price': 80,
    },
    {
      'title': 'Home Brewing Methods',
      'description': 'Explore various home brewing techniques.',
      'price': 55,
    },
  ];

  String _searchQuery = '';
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Training Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            _buildFilterDropdown(),
            Expanded(child: _buildTrainingList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
    );
  }

  Widget _buildFilterDropdown() {
    return DropdownButton<String>(
      value: _selectedFilter,
      items: <String>['All', 'Beginner', 'Intermediate', 'Advanced']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedFilter = value!;
        });
      },
    );
  }

  Widget _buildTrainingList() {
    final filteredTrainings = _trainings.where((training) {
      final matchesSearchQuery = training['title']
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      final matchesFilter = _selectedFilter == 'All' ||
          (training['price'] <= 50 && _selectedFilter == 'Beginner') ||
          (training['price'] > 50 && training['price'] <= 75 && _selectedFilter == 'Intermediate') ||
          (training['price'] > 75 && _selectedFilter == 'Advanced');
      return matchesSearchQuery && matchesFilter;
    }).toList();

    return ListView.builder(
      itemCount: filteredTrainings.length,
      itemBuilder: (context, index) {
        final training = filteredTrainings[index];
        return Card(
          child: ListTile(
            title: Text(training['title']),
            subtitle: Text(training['description']),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${training['price']}'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrainerPage(
                          selectedTraining: training,
                        ),
                      ),
                    );
                  },
                  child: Text('Apply'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}