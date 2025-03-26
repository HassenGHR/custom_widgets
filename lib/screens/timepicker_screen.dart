import 'package:flutter/material.dart';

class TimePickerScreen extends StatefulWidget {
  @override
  _TimePickerScreenState createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  TimeOfDay? _selectedTime;

  void _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TimePicker Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_selectedTime == null
                ? 'No time selected'
                : 'Selected Time: ${_selectedTime!.format(context)}'),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _pickTime, child: Text('Pick a Time')),
          ],
        ),
      ),
    );
  }
}
