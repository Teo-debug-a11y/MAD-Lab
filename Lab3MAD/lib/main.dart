import 'package:flutter/material.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const Lab3CruiseApp());
}

class Lab3CruiseApp extends StatelessWidget {
  const Lab3CruiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 3 Cruise App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const CruiseBookingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}