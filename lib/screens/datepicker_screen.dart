import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime? _selectedDate;

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DatePicker Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_selectedDate == null
                ? 'No date selected'
                : 'Selected Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _pickDate, child: Text('Pick a Date')),
          ],
        ),
      ),
    );
  }
}
