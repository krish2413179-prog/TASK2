import 'package:flutter/material.dart';
import 'package:task2/SignUpPage.dart';
import 'package:task2/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Signuppage(),);
  }
}
