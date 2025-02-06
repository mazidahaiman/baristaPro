import 'package:flutter/material.dart';
import 'Trainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      'date': DateTime(2025, 02, 20),
    },
    {
      'title': 'Advanced Espresso Techniques',
      'description': 'Master the art of espresso making.',
      'price': 100,
      'date': DateTime(2025, 02, 21),
    },
    {
      'title': 'Latte Art Workshop',
      'description': 'Create beautiful latte art.',
      'price': 75,
      'date': DateTime(2025, 02, 22),
    },
    {
      'title': 'Cold Brew Mastery',
      'description': 'Learn how to make the perfect cold brew.',
      'price': 60,
      'date': DateTime(2025, 02, 23),
    },
    {
      'title': 'Coffee Cupping',
      'description': 'Taste and evaluate different coffee beans.',
      'price': 80,
      'date': DateTime(2025, 02, 24),
    },
    {
      'title': 'Home Brewing Methods',
      'description': 'Explore various home brewing techniques.',
      'price': 55,
      'date': DateTime(2025, 02, 25),
    },
  ];

    @override
  void initState() {
    super.initState();
    _saveTrainingsToFirestore();
  }

    Future<void> _saveTrainingsToFirestore() async {
    final CollectionReference trainingsCollection = FirebaseFirestore.instance.collection('trainingsCollection');

    for (var training in _trainings) {
      await trainingsCollection.add({
        'title': training['title'],
        'description': training['description'],
        'price': training['price'],
        'date': Timestamp.fromDate(training['date']),
      });
    }
  }

  DateTime? _selectedDate;
  List<Map<String, dynamic>> filteredTrainings = [];

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _filterTrainings();
      });
    }
  }

  void _filterTrainings() {
    if (_selectedDate == null) {
      filteredTrainings = _trainings;
    } else {
      filteredTrainings = _trainings.where((training) {
        return training['date'] == _selectedDate;
      }).toList();
    }
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _pickDate,
                  child: Text(_selectedDate == null
                      ? 'Choose Date'
                      : 'Selected Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
                ),
                _buildFilterDropdown(),
              ],
            ),
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
      final matchesDate = _selectedDate == null || training['date'] == _selectedDate;
    return matchesSearchQuery && matchesFilter && matchesDate;
    }).toList();

    return ListView.builder(
      itemCount: filteredTrainings.length,
      itemBuilder: (context, index) {
        final training = filteredTrainings[index];
        return Card(
          child: ListTile(
            title: Text('${training['title']} (${training['date'].toLocal().toString().split(' ')[0]})'),
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