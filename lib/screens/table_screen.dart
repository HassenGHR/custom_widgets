import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table Widget')),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 1, Col 1'))),
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 1, Col 2'))),
            ]),
            TableRow(children: [
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 2, Col 1'))),
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Row 2, Col 2'))),
            ]),
          ],
        ),
      ),
    );
  }
}
