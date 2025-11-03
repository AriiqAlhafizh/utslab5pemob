import 'package:flutter/material.dart';
import 'package:utslab5pemob/Screen/home_screen.dart';
import 'package:utslab5pemob/Screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfileScreen(),
    );
  }
}