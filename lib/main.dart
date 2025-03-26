import 'package:animations_widgets/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomDrawer(
        child: Scaffold(
          appBar: AppBar(title: const Text("Custom Drawer")),
          body: const Center(child: Text("Swipe from the left edge to open.")),
        ),
      ),
    );
  }
}
