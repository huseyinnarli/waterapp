import 'package:flutter/material.dart';
import 'package:waterapp/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaterApp',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}