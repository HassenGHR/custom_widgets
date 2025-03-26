import 'package:flutter/material.dart';

class DateRangePickerScreen extends StatefulWidget {
  @override
  _DateRangePickerScreenState createState() => _DateRangePickerScreenState();
}

class _DateRangePickerScreenState extends State<DateRangePickerScreen> {
  DateTimeRange? _selectedRange;

  void _pickDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DateRangePicker Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedRange == null
                  ? 'No date range selected'
                  : 'From: ${_selectedRange!.start.toLocal()} To: ${_selectedRange!.end.toLocal()}'
                      .split(' ')[0],
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: _pickDateRange, child: Text('Pick a Date Range')),
          ],
        ),
      ),
    );
  }
}
