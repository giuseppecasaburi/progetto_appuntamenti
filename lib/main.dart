import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment Manager',
      home: Scaffold(
        body: Center(child: Text("Splash ok")),
      ),
    );
  }
}