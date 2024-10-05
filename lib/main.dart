import 'package:flutter/material.dart';

import 'amazonApp/view/home_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcomWeb',
      theme: ThemeData.dark(),
      home: EcomWeb(),
    );
  }
}
