import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cupertino Action Sheet')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: Text('Options'),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Option 1'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Option 2'),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  isDefaultAction: true,
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ),
            );
          },
          child: Text("Show Cupertino Menu"),
        ),
      ),
    );
  }
}
