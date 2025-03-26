import 'package:flutter/material.dart';

class PopupMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PopupMenuButton Widget')),
      body: Center(
        child: PopupMenuButton<String>(
          onSelected: (value) {},
          itemBuilder: (context) => [
            PopupMenuItem(child: Text("Option 1"), value: "1"),
            PopupMenuItem(child: Text("Option 2"), value: "2"),
          ],
        ),
      ),
    );
  }
}
