import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddJobForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddJob;

  const AddJobForm({required this.onAddJob, super.key});

  @override
  _AddJobFormState createState() => _AddJobFormState();
}

class _AddJobFormState extends State<AddJobForm> {
  final _formKey = GlobalKey<FormState>();
  final _jobTitleController = TextEditingController();
  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _locationController = TextEditingController();
  final _jobScopeController = TextEditingController();

  @override
  void dispose() {
    _jobTitleController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _locationController.dispose();
    _jobScopeController.dispose();
    super.dispose();
  }

  Future<void> _addJobToFirebase(Map<String, dynamic> newJob) async {
    try {
      await FirebaseFirestore.instance.collection('jobs').add(newJob);
    } catch (e) {
      print('Error adding job to Firestore: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add job. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _jobTitleController,
                decoration: InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),
              DateTimeField(
                controller: _dateController,
                format: DateFormat("yyyy-MM-dd"),
                decoration: InputDecoration(labelText: 'Date'),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              DateTimeField(
                controller: _startTimeController,
                format: DateFormat("HH:mm"),
                decoration: InputDecoration(labelText: 'Start Time'),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return time != null ? DateTimeField.convert(time) : null;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a start time';
                  }
                  return null;
                },
              ),
              DateTimeField(
                controller: _endTimeController,
                format: DateFormat("HH:mm"),
                decoration: InputDecoration(labelText: 'End Time'),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return time != null ? DateTimeField.convert(time) : null;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please enter an end time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jobScopeController,
                decoration: InputDecoration(labelText: 'Job Scope'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job scope';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newJob = {
                      'jobTitle': _jobTitleController.text,
                      'date': _dateController.text,
                      'startTime': _startTimeController.text,
                      'endTime': _endTimeController.text,
                      'location': _locationController.text,
                      'jobScope': _jobScopeController.text,
                    };
                    await _addJobToFirebase(newJob);
                    widget.onAddJob(newJob);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}