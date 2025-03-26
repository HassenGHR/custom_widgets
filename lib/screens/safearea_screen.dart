import 'package:flutter/material.dart';

class SafeAreaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("This is inside a SafeArea"),
        ),
      ),
    );
  }
}
