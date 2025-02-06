import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  final String selectedArea;
  final double selectedRange;
  final Function(String, double) onApply;

  const FilterSheet({
    required this.selectedArea,
    required this.selectedRange,
    required this.onApply,
  });

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late String area;
  late double range;

  @override
  void initState() {
    super.initState();
    area = widget.selectedArea;
    range = widget.selectedRange;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Jobs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: area,
            items: ['All', 'Remote', 'New York, NY', 'San Francisco, CA']
                .map((area) => DropdownMenuItem(
                      value: area,
                      child: Text(area),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                area = value!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Area',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text('Range (km): ${range.toInt()}'),
          Slider(
            value: range,
            min: 0,
            max: 100,
            divisions: 10,
            label: range.toInt().toString(),
            onChanged: (value) {
              setState(() {
                range = value;
              });
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              widget.onApply(area, range);
            },
            child: Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}