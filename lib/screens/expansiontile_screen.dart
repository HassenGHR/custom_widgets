import 'package:flutter/material.dart';

class ExpansionTileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionTile Widget')),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text("Expand Me"),
            children: [
              ListTile(title: Text("Item 1")),
              ListTile(title: Text("Item 2")),
            ],
          ),
        ],
      ),
    );
  }
}
