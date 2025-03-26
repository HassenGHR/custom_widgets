import 'package:flutter/material.dart';

class CheckboxListScreen extends StatefulWidget {
  @override
  _CheckboxListScreenState createState() => _CheckboxListScreenState();
}

class _CheckboxListScreenState extends State<CheckboxListScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckboxListTile Widget')),
      body: Center(
        child: CheckboxListTile(
          title: Text("Check me"),
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue!;
            });
          },
        ),
      ),
    );
  }
}
