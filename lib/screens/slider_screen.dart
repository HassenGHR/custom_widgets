import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _value = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Value: ${_value.toStringAsFixed(1)}'),
            Slider(
              value: _value,
              min: 0,
              max: 100,
              divisions: 10,
              label: _value.toStringAsFixed(1),
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
