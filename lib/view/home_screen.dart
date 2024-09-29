import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class EcomWeb extends StatefulWidget {
  const EcomWeb({super.key});

  @override
  State<EcomWeb> createState() => _EcomWebState();
}

class _EcomWebState extends State<EcomWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const EcomNavbar(), // Use the custom EcomNavbar widget here
        backgroundColor: Colors.white, // Set AppBar background color
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
