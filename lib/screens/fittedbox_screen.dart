import 'package:flutter/material.dart';

class FittedBoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox Widget')),
      body: Center(
        child: Container(
          width: 300,
          height: 100,
          color: Colors.blue,
          child: FittedBox(
            child: Text(
              "FittedBox Example",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
