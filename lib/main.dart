import 'package:flutter/material.dart';

void main() {
  runApp(const MiPrimeraApp());
}

class MiPrimeraApp extends StatelessWidget {
  const MiPrimeraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text(
            'Hello world',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}